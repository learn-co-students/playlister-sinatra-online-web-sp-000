# Add seed data here. Seed your database with `rake db:seed`

sophie = Artist.create(name: "Sophie")
sophie = Artist.create(name: "Lara")
jazz = Genre.create(name: "Jazz")
jazz = Genre.create(name: "Rock")
Song.create(name: "Song 1", artist: sophie, genres: [jazz])
Song.create(name: "Song 2", artist: sophie, genres: [jazz])