# Add seed data here. Seed your database with `rake db:seed`
@song = Song.create(name: "Zoo Kid")
@genre = Genre.create(name: "hip-hop")
@artist = Artist.create(name: "Out Getting Ribs")

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
