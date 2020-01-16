# Add seed data here. Seed your database with `rake db:seed`

sophie = Owner.create(name: "Sophie")
Song.create(name: "Maddy", artist: sophie)
Song.create(name: "Nona", artist: sophie)