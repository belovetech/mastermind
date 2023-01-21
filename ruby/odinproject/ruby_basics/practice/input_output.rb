#!/usr/bin/ruby

# Output
afile = File.new("output.txt", "r")

if afile
    begin
        content = afile.sysread(20)
        puts content
    rescue
        puts "Something is wrong!"
    end
else
    puts "Unable to open file!"
end

afile.close

# Input
afile = File.new("input.txt", "w+")
if afile
    begin
        afile.syswrite("Hey world!")
    rescue
        puts "Something went wrong!"
    end
else
    puts "Unable to open file"
end
afile.close

# IO.readlines
arr = IO.readlines("output.txt")
# arr.each { |line| puts line }

# IO.foreach
# IO.foreach("output.txt") { |block| puts block }

# FILE RENAME AND DELETE
File.rename("input.txt", "inputs.txt")

File.delete("inputs.txt")

