# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

billy_joel = Artist.create!({name: "Billy Joel"})

Song.create!({ name: "Allentown", runtime: 432, artist: billy_joel })
Song.create!({ name: "Uptown Girl", runtime: 654, artist: billy_joel })
Song.create!({ name: "Goodnight Saigon", runtime: 200, artist: billy_joel })
Song.create!({ name: "Honesty", runtime: 454, artist: billy_joel})
