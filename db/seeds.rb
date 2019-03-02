# Add seed data here. Seed your database with `rake db:seed`

pink_floyd = Artist.create(name: "Pink Floyd")
hey_you = Song.create(name: "Hey You")
classic_rock = Genre.create(name: "Classic Rock")

hey_you.genres = classic_rock
pink_floyd.songs << hey_you