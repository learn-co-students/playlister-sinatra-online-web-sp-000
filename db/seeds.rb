# Add seed data here. Seed your database with `rake db:seed`
nasx = Artist.create(name: "Lil' Nas X")
bill_strings = Artist.create(name: "Billy Strings")
rap = Genre.create(name: "Rap")
rnb = Genre.create(name: "R&B")
country = Genre.create(name: "Country")
bluegrass = Genre.create(name: "Bluegrass")
Song.create(name: "Old Town Road", artist: nasx, genres: [rap, rnb])
Song.create(name: "Powder in a Baggy", artist: bill_strings, genres: [bluegrass, country])