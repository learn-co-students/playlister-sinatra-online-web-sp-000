# Add seed data here. Seed your database with `rake db:seed`
sc = Artist.create(:name => "Strange Condition")
swift = Artist.create(:name => "Taylor Swift")
distant = Artist.create(:name => "Distant Crossing")
tool = Artist.create(:name => "Tool")
rundmc = Artist.create(:name => "Run DMC")

window = Song.create(:name => "Window", :artist => sc)
blank = Song.create(:name => "Blank Space", :artist => swift)
bloodshot = Song.create(:name => "Bloodshot Eyes", :artist => distant)
side = Song.create(:name => "Side of Mine", :artist => distant)
sober = Song.create(:name => "Sober", :artist => tool)
enema = Song.create(:name => "Enema", :artist => tool)
lateralus = Song.create(:name => "Lateralus", :artist => tool)
tricky = Song.create(:name => "It's Tricky", :artist => rundmc)

rock = Genre.create(:name => "Rock")
pop = Genre.create(:name => "Pop")
rap = Genre.create(:name => "Rap")
metal = Genre.create(:name => "Metal")
prog = Genre.create(:name => "Prog Rock")

window.genre_ids = rock.id
blank.genre_ids = pop.id
bloodshot.genre_ids = rock.id
side.genre_ids = rock.id
sober.genre_ids = metal.id
enema.genre_ids = metal.id
lateralus.genre_ids = prog.id
tricky.genre_ids = rap.id

