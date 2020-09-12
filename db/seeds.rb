# In our data file layout 
# artist - song[genre].mp3


# if we call db/data want to iterate and parse data
# then:

# Artist.create(name: "artist_name")
# Song.create(name: "song_name", artist_id: artist.id)
# Genre.create(name: "genre_name")

LibraryParser.parse
