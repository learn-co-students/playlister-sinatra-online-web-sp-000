# Add seed data here. Seed your database with `rake db:seed`
a = Song.create(name: "Song 1")
b = Song.create(name: "Song 2")
c = Song.create(name: "Song 3")

d = Artist.create(name: "Artist 1")
e = Artist.create(name: "Artist 2")
f = Artist.create(name: "Artist 3")

g = Genre.create(name: "Rock")
h = Genre.create(name: "Pop")
i = Genre.create(name: "Jazz")

a.artist = d
a.genres << g
a.genres << h
a.save

b.artist = e
b.genres << h
b.save

c.artist = f
c.genres << i
c.save
