# Add seed data here. Seed your database with `rake db:seed`
taylor_swift = Artist.create(:name => "Taylor Swift")
blank_space = Song.create(:name => "Blank Space", :artist => taylor_swift)
pop = Genre.create(:name => "Pop")
blank_space.genre_ids = pop.id

adele = Artist.create(:name => "Adele")
hello = Song.create(:name => "Hello", :artist => adele)
hello.genre_ids = pop.id

maren_morris = Artist.create(:name => "Maren Morris")
rich = Song.create(:name => "Rich", :artist => maren_morris)
country = Genre.create(:name => "Country")
rich.genre_ids = country.id

carrie_underwood = Artist.create(:name => "Carrie Underwood")
mexico = Song.create(:name => "Mexico", :artist => carrie_underwood)
mexico.genre_ids = country.id

change = Song.create(:name => "Change", :artist => taylor_swift)
change.genre_ids = pop.id

the_middle = Song.create(:name => "The Middle", :artist => maren_morris)
the_middle.genre_ids = pop.id
