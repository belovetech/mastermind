#!/usr/bin/ruby
# A simple sinatra application

require "sqlite3"

class User
  # A representation of user model
  attr_reader :id, :firstname, :lastname, :age, :password, :email
  attr_writer :firstname, :lastname, :age, :password, :email
  @table_name = "users"

  def initialize(id, firstname, lastname, age, password, email)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @age = age
    @password = password
    @email = email
  end

  def self.connect
    @db = SQLite3::Database.open "./db.sql"
    @db.results_as_hash = true
    @db.execute "CREATE TABLE IF NOT EXISTS #{@table_name} (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      firstname VARCHAR(30),
      lastname VARCHAR(30),
      age INTEGER,
      password VARCHAR(30),
      email VARCHAR(30)
    )"
    @db
  end

  def self.create(user_info)
    @db = connect
    row =
      @db.get_first_row "INSERT INTO #{@table_name}
      (firstname,lastname, age, password, email) VALUES
      (?,?,?,?,?) RETURNING id, firstname, lastname, age, password, email",
                        user_info["firstname"],
                        user_info["lastname"],
                        user_info["age"],
                        user_info["password"],
                        user_info["email"]
    User.new(*row.values)
    # row[0].to_i
  end

  def self.find(user_id)
    @db.get_first_row "SELECT id, firstname, lastname, age, email
                           FROM #{@table_name} WHERE id = ?",
                      user_id
  end

  def self.find_by(**user_info)
    row =
      @db.get_first_row "SELECT id, firstname, lastname, age, email FROM #{@table_name} WHERE email=? AND password=?",
                        user_info["email"],
                        user_info["password"]
  end

  def self.all
    @db = connect
    users = @db.execute "SELECT * FROM #{@table_name}"
    users.map do |user|
      {
        id: user[0],
        firstname: user[1],
        lastname: user[2],
        age: user[3],
        password: user[4],
        email: user[5]
      }
    end
  end

  def self.update(user_id, attribute, value)
    @db = connect
    @db.execute "UPDATE #{@table_name} SET '#{attribute}'='#{value}' WHERE id=?",
                user_id
    find(user_id)
  end

  def self.destroy(user_id)
    @db = connect
    @db.execute "DELETE FROM #{@table_name} WHERE id=?", user_id
  end
end

def main
  User.connect
  # user_info = {
  #   firstname: "Bob",
  #   lastname: "jane",
  #   age: 21,
  #   password: "bob123",
  #   email: "bob@gmail.com"
  # }
  # user = User.create(user_info)
  # p user

  id = User.find(156)
  p id
  p *id.values

  # users = User.all
  # p users

  # updated_user = User.update(106, "firstname", "Mike")
  # p updated_user
  # User.destroy(106)
  # p users

  # info = { email: "bob@gmail.com", password: "bob123" }
  # user = User.find_by(**info)
  # p user["id"]
end

main
