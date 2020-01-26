# Add seed data here. Seed your database with `rake db:seed`

sophie = Artist.create(name: "Sophie")
jazz = Genre.create(name: "Jazz")
Song.create(name: "Maddy", artist: sophie, genre: jazz)
Song.create(name: "Nona", artist: sophie, genre: jazz)