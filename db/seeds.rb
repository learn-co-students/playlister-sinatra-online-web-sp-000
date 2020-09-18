# Add seed data here. Seed your database with `rake db:seed`
ed = Artist.find_or_create_by(name: "Ed Sheeran")
michael = Artist.find_or_create_by(name: "Michael Buble`")
lisa = Artist.find_or_create_by(name: "LiSA")

pop = Genre.find_or_create_by(name: "Pop")
rock = Genre.find_or_create_by(name: "Rock")
alternative = Genre.find_or_create_by(name: "Alternative")

Song.find_or_create_by(name: "Oath Sign")
Song.find_or_create_by(name: "Crossing Field")
Song.find_or_create_by(name: "Just Haven't Met You Yet")
Song.find_or_create_by(name: "Everything")
Song.find_or_create_by(name: "Perfect")
Song.find_or_create_by(name: "Dive")



