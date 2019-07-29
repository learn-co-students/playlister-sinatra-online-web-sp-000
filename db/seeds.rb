# LibraryParser.parse
song = Song.create(name: "Candyman")
artist = Artist.create(name: "Dude")
genre1 = Genre.create(name: "Hip Punk")
genre2 = Genre.create(name: "Punk Jazz")
song.artist_id = artist.id
song.genres << genre1
song.genres << genre2
song.save