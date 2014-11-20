# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create development user for testing.
if ENV["LOOSELEAF_ROOT_USERNAME"].blank?
  puts "Environment variable `LOOSELEAF_ROOT_USERNAME' cannot be blank."
  exit
elsif ENV["LOOSELEAF_ROOT_PASSWORD"].blank?
  puts "Environment variable `LOOSELEAF_ROOT_PASSWORD' cannot be blank."
  exit
else
  User.create! name: ENV["LOOSELEAF_ROOT_USERNAME"],
    password: ENV["LOOSELEAF_ROOT_PASSWORD"]
end
