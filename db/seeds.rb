# Add seed data here. Seed your database with `rake db:seed`

bowie = Artist.create(name: "David Bowie")
heroes = Song.create(name: "Heroes", artist: bowie)
pop = Genre.create(name: "Pop")
heroes.song_genres.create(genre: pop)
heroes.artist = bowie
