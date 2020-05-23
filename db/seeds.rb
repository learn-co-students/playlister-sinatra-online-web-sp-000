# # Add seed data here. Seed your database with `rake db:seed`
# let(:artist_name) { "Person with a Face" }
# let(:genre_name) { "New Age Garbage" }
# let(:song_name) { "That One with the Guitar" }

@song = Song.create(name: "That One with the Guitar" )
@genre = Genre.create(name:  "New Age Garbage" )
@artist = Artist.create(name:  "Person with a Face" )

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save