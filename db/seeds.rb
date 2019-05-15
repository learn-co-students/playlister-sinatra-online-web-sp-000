# Add seed data here. Seed your database with `rake db:seed`

artist = Artist.create(name: "Person with a Face")
genre = Genre.create(name: "New Age Garbage")
song = Song.create(name: "That One with the Guitar")
song_genres = SongGenre.create()
song.song_genres.create(genre: genre)
song.artist = artist
song.save