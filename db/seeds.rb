# Add seed data here. Seed your database with `rake db:seed`

# @artist = Artist.create(:name => "Taylor Swift") 
# blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 
pop = Genre.create(:name => "Pop")
# blank_space.genre_ids = pop.id

#   p "Testing artist instace", @artist#to be_an_instance_of(Artist)
#   p "Testing artist.name", @artist.name #to eq("Taylor Swift")
#   p "Testing artist.song.count", @artist.songs.count#to eq(1)
#   p "Testing artist.genre.count", @artist.genres.count# to eq(1)
#   p "Testing artist.slug",@artist.slug #to eq("taylor-swift"
# p pop.song_genres
Genre.create(name: "Regueton")
Genre.create(name: "Bachata")
Genre.create(name: "Balada")