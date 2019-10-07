# Add seed data here. Seed your database with `rake db:seed`
Song.delete_all
Genre.delete_all
Artist.delete_all


filename = []
entries = Dir.glob("./db/data/*.mp3")

entries.map do |file| a = file.split("./db/data/")
  filename << a[1]
end

artist_array = []
song_genres = []

filename.map do |file| a = file.split(" - ")
  artist_array << a[0]
  song_genres << a[1]
end

#artist_array.each { |artist| Artist.create(name: artist)}

song_array = []
genre_array_incomplete = []

song_genres.map do |file| a = file.split(" [")
  song_array << a[0]
  genre_array_incomplete << a[1]
end

#song_array.each { |song| Song.create(name: song)}

genre_array = []

genre_array_incomplete.map do |file| a = file.split("].")
  genre_array << a[0]
end

i = 0
artist_array.each do |artist|
  if a = Artist.find_by(name: artist)
  else
  a = Artist.create(name: artist)
  end
  b = Song.create(name: song_array[i])
  if c = Genre.find_by(name: genre_array[i])
  else
  c = Genre.create(name: genre_array[i])
  end
  b.genres << c
  a.songs << b
  a.save
  i = i + 1
end




#genre_array.each { |genre| Genre.create(name: genre)}

#hotline_bling = Song.create(:name=>'Hotline Bling')
#thriller = Song.create(:name=>'Thriller')
#blank_space = Song.create(:name=>'Blank Space')
#
#drake = Artist.create(:name=>'Drake')
#mj = Artist.create(:name=>'Michael Jackson')
#taylor = Artist.create(:name=>'Taylor Swift')
#
#rap = Genre.create(:name=>'Rap')
#pop = Genre.create(:name=>'Pop')
#balad = Genre.create(:name=>'Balad')
#
#hotline_bling.artist = drake
#thriller.artist = mj
#blank_space.artist = taylor
#
#drake.songs << hotline_bling
#mj.songs << thriller
#taylor.songs << blank_space
#
#pop.songs << thriller
#rap.songs << hotline_bling
#balad.songs << blank_space
#pop.songs << blank_space
