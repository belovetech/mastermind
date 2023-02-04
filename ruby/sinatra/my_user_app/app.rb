#!/usr/bin/ruby
#  A simple sinatra application
require "sqlite3"
require "sinatra"
require "erb"
require "json"
require "./my_user_model"

# Configuration
enable :sessions
set("views", "./views")
set :bind, "0.0.0.0"
set :port, 8080

# Connect DB
User.connect

# Get request body
def getBody(req)
  # Rewind the request should it had been read
  req.body.rewind
  # Parse the body
  return JSON.parse(req.body.read)
end

# Get all users
get("/users") do
  users = User.all()
  users.each { |user| user.delete(:password) }
  # data = { status: "success", results: users.length, users: users }
  return users.to_json
end

# Get a user
get("/users/:id") do
  id = params["id"].to_i
  user = User.find(id)

  if user
    # data = { status: "success", user: user }
    return user.to_json
  else
    halt 404, "No User found"
  end
end

# Create a new user
post("/users") do
  # Create new user
  user = getBody(request)
  user = User.create(user)

  new_user = {
    id: user.id,
    firstname: user.firstname,
    lastname: user.lastname,
    age: user.age,
    email: user.email
  }
  status 201
  # data = { status: "success", user: new_user }
  return new_user.to_json
end

# Update password
put("/users/:id") do
  user_id = session["user_id"]
  id = params["id"].to_i
  user = User.find(id)

  if user && user_id == id
    body = getBody(request)
    user = User.update(id, "password", body["password"])
    # data = { status: "success", user: user }
    return user.to_json
  else
    halt 404, "You're not logged in, kindly login"
  end
end

# Delete User
delete("/users/:id") do
  id = params["id"].to_i
  user_id = session["user_id"]
  user = User.find(id)

  if user && user_id == id
    User.destroy(id)
    status 204
  else
    halt 401, "You're not logged in, kindly login"
  end
end

# Sign in
post("/sign_in") do
  body = getBody(request)
  user = User.find_by(**body)

  if user
    session["user_id"] = user["id"]
  else
    halt 401, "Incorrect email or password"
  end

  # data = { status: "success", user: user }
  return user.to_json
end

# Sign Out
delete("/sign_out/:id") do
  id = params["id"].to_i
  user_id = session["user_id"]
  user = User.find(id)

  if user && user_id == id
    session.delete(["user_id"])
    halt 204
  else
    halt 401, "You are not logged in yet!"
  end
end

# Render view
get("/") do
  @users = User.all()
  erb :index
end
