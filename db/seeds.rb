# Add seed data here. Seed your database with `rake db:seed`

@jay_z = Artist.new(name: "Jay-Z")
@problems = Song.new(name: "99 Problems", artist: @jay_z)
@hip_hop = Genre.new(name: "Hip Hop")

@mobb_deep = Artist.new(name: "Mobb Deep")
@infamous = Song.new(name: "Infamous", artist: @mobb_deep)
@rap = Genre.new(name: "Rap")

@bob_marely = Artist.new(name: "Bob Marely")
@dont_worry = Song.new(name: "Don't Worry About A Thing")
@regge = Genre.new(name: "Regge")