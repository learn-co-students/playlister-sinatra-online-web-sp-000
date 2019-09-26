# Add seed data here. Seed your database with `rake db:seed`
Song.delete_all
Genre.delete_all
Artist.delete_all

hotline_bling = Song.create(:name=>'Hotline Bling')
thriller = Song.create(:name=>'Thriller')
blank_space = Song.create(:name=>'Blank Space')

drake = Artist.create(:name=>'Drake')
mj = Artist.create(:name=>'Michael Jackson')
taylor = Artist.create(:name=>'Taylor Swift')

rap = Genre.create(:name=>'Rap')
pop = Genre.create(:name=>'Pop')
balad = Genre.create(:name=>'Balad')

hotline_bling.artist = drake
thriller.artist = mj
blank_space.artist = taylor

drake.songs << hotline_bling
mj.songs << thriller
taylor.songs << blank_space

pop.songs << thriller
rap.songs << hotline_bling
balad.songs << blank_space 
pop.songs << blank_space

