# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Band.destroy_all
Album.destroy_all

25.times do
    b = Band.create(name: Faker::Music.band)
    3.times do
        a = Album.create(name: Faker::Music.album, band_id: b.id, year: Faker::Number.within(range: 1958..2022), live: Faker::Boolean.boolean(true_ratio: 0.2))
    end
end