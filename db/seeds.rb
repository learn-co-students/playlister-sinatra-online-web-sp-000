# Add seed data here. Seed your database with `rake db:seed`
nasx = Artist.create(name: "Lil' Nas X")
bill_strings = Artist.create(name: "Billy Strings")
rap = Genre.find_by_name("Rap")
rnb = Genre.find_by_name("R&B")
country = Genre.create(name: "Country")
bluegrass = Genre.create(name: "Bluegrass")
Song.create(name: "Old Town Road", artist: nasx, genres: [rap, rnb])
Song.create(name: "Powder in a Baggy", artist: bill_strings, genres: [bluegrass, country])