# Add seed data here. Seed your database with `rake db:seed`
radiohead = Artist.create(name: "Radiohead")
beatles = Artist.create(name: "Beatles")
vijay_iyer = Artist.create(name: "Vijay Iyer")

creep = Song.create(name: "Creep")
blackbird = Song.create(name: "Blackbird")
midwood = Song.create(name: "Song for Midwood")

radiohead.songs << creep
beatles.songs << blackbird
vijay_iyer.songs << midwood

pop = Genre.create(name: "Pop")
rock = Genre.create(name: "Rock")
jazz = Genre.create(name: "Jazz")

creep.genre_ids = pop.id
blackbird.genre_ids = rock.id
midwood.genre_ids = jazz.id

radiohead.save
beatles.save
vijay_iyer.save
