# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all
Note.destroy_all
4.times do
    u = User.create(email: Faker::Internet.email, password: Faker::Lorem.word)
end
200.times do
    b = Band.create(name: Faker::Music.band)
    5.times do
        a = Album.create(name: Faker::Music.album, band_id: b.id, year: Faker::Number.within(range: 1958..2022), live: Faker::Boolean.boolean(true_ratio: 0.2))
        i = 1
        10.times do
            t = Track.create(name: Faker::Lorem.sentence(word_count: 2), album_id: a.id, ord: i, bonus: Faker::Boolean.boolean(true_ratio: 0.1), lyrics: Faker::Lorem.paragraph(sentence_count: 15))
            i+=1
            n = Note.create(track_id: t.id, user_id: u.id, content: Faker::Lorem.sentences(number: 1))
        end
    end
end