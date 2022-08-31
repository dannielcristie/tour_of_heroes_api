# This file should contain all the record creation needed to seed the database with its default values.

Hero.delete_all

5.times do
  Hero.create name: Faker::Superhero.name
end
