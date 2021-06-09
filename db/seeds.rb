# Add seed data here. Seed your database with `rake db:seed`

beatles = Artist.create(name: "The Beatles")
sun = beatles.songs.create(name: "Here Comes The Sun")
something = beatles.songs.create(name:"Something")
sun.genres.create(name:"Rock")
something.genres.create(name:"Acoustic")

hop = Artist.create(name: "Hop Along")
prior = hop.songs.create(name:"Prior Things")
prior.genres.create(name:"Loud")