# Add seed data here. Seed your database with `rake db:seed`
nate = Artist.create(name: "Nate")
hello = Song.create(name: "Hello")
rock = Genre.create(name: "Rock")

hello.artist = nate
hello.genres << rock

alex = Artist.create(name: "Alex")
yo = Song.create(name: "Yo")
rap = Genre.create(name: "Rap")

yo.artist = alex
yo.genres << rap
