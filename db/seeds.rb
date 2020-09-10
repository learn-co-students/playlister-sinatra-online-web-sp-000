# Add seed data here. Seed your database with `rake db:seed`

Artist.create(name: "Joseph")
song = Song.create(name: "Your Song")
song.artist = Artist.first
song2 = Song.create(name: "My Song")
song2.artist = Artist.first