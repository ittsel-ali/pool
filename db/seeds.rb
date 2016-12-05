# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(full_name: 'ittsel ali')
Customer.create(full_name: 'awais')

Edible.create(name: 'tea')
Edible.create(name: 'coke')
Edible.create(name: 'chips')

Game.create(name: 'single')
Game.create(name: 'double')
Game.create(name: 'century')
