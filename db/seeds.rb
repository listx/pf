# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create development user for testing.
if ENV["PF_ROOT_USERNAME"].blank?
  puts "Environment variable `PF_ROOT_USERNAME' cannot be blank."
  exit
elsif ENV["PF_ROOT_PASSWORD"].blank?
  puts "Environment variable `PF_ROOT_PASSWORD' cannot be blank."
  exit
else
  User.create! name: ENV["PF_ROOT_USERNAME"],
    password: ENV["PF_ROOT_PASSWORD"]
end
