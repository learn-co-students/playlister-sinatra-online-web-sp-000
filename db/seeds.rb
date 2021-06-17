# Add seed data here. Seed your database with `rake db:seed`

# # Create Artists
# nena = Artist.create(name: "Nena")
# volbeat = Artist.create(name: "Volbeat")
# bvb = Artist.create(name: "Black Veil Brides")
# acdc = Artist.create(name: "AC-DC")
# tend = Artist.create(name: "Tenacious D")
# jazzband = Artist.create(name: "A Jazz Band")
# imagine = Artist.create(name: "Imagine Dragons")

# # # Create Genres
# alt = Genre.create(name: "Alternative")
# rock = Genre.create(name: "Rock")
# metal = Genre.create(name: "Metal")
# jazz = Genre.create(name: "Jazz")

# # Create Songs
# # binding.pry
# Song.create(name: "99 Red Ballons", artist: nena, genres: [alt])
# Song.create(name: "Wait A Minute My Girl", artist: volbeat, genres: [metal])
# Song.create(name: "Scarless Cross", artist: bvb, genres: [rock])
# Song.create(name: "Back In Black", artist: acdc, genres: [rock])
# Song.create(name: "For Those About To Rock", artist: acdc, genres: [rock])
# Song.create(name: "Tribute", artist: tend, genres: [rock])
# Song.create(name: "A Jazz Song", artist: jazzband, genres: [jazz])
# Song.create(name: "Radioactive", artist: imagine, genres: [alt])

LibraryParser.parse

