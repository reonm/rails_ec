# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
item = Item.create(title: 'Fancy Product',
  description: '$40.00 - $80.00',
  price: 40,
  status: 1)

item = Item.create(title: 'Special Item',
  description: '$18.00',
  price: 18,
  status: 2)

item = Item.create(title: 'Sale Item',
  description: '$25.00',
  price: 25,
  status: 3)

item = Item.create(title: 'Popular Item',
  description: '$40.00',
  price: 40,
  status: 4)