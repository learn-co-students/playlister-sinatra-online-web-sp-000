# Add seed data here. Seed your database with `rake db:seed`

chris_thile = Artist.create(name: "Chris Thile")
sarah_watkins = Artist.create(name: "Sarah Watkins")

bluegrass = Genre.create(name: "Bluegrass")
folk = Genre.create(name: "Folk")

song_1 = Song.create(name: "Song 1")
song_2 = Song.create(name: "Song 2")
song_3 = Song.create(name: "Song 3")
song_4 = Song.create(name: "Song 4")
song_5 = Song.create(name: "Song 5")
song_6 = Song.create(name: "Song 6")

# song_1.artist = chris_thile
# song_1.genre =  bluegrass
# song_2.artist = sarah_watkins
# song_2.genre = bluegrass
# song_3.artist = chris_thile
# song_3.genre = folk
# song_4.artist = sarah_watkins
# song_4.genre = folk
# song_5.artist = chris_thile
# song_5.genre = bluegrass
# song_5.genre = folk
# song_6.artist = sarah_watkins
# song_6.genre = bluegrass
# song_6.genre = folk

