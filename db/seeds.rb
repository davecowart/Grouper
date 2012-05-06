# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create([{name: "Admin", rank: 15}, {name: "GroupAdmin", rank: 10}, {name: "User", rank: 5}, {name: "Guest", rank: 1}])