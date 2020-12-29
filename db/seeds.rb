# Add seed data here. Seed your database with `rake db:seed`
#@artist = Artist.create(:name => "Taylor Swift")
#blank_space =  Song.create(:name => "Blank Space", :artist => @artist)
#pop = Genre.create(:name => "Pop")
#blank_space.genre_ids = pop.id

#@artist = Artist.create(:name => "Justin Timberlake")
#cry_me_a_river =  Song.create(:name => "Cry Me A River", :artist => @artist)
#pop = Genre.create(:name => "Pop")
#cry_me_a_river.genre_ids = pop.id

#@artist = Artist.create(:name => "TLC")
#waterfalls =  Song.create(:name => "Waterfalls", :artist => @artist)
#rnb = Genre.create(:name => "RnB")
#waterfalls.genre_ids = rnb.id

LibraryParser.parse
