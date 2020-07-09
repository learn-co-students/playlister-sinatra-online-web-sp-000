# Add seed data here. Seed your database with `rake db:seed`

drake = Artist.create(name: "Drake")
malone = Artist.create(name: "Post Malone")
future = Artist.create(name: "Future")


toosie_slide = Song.create(name: "Toosie Slide")
rockstar = Song.create(name: "Rockstar")
mask_off = Song.create(name: "Mask Off")

drake.songs << toosie_slide
malone.songs << rockstar
future.songs << mask_off

rap = Genre.create(name: "Rap")

toosie_slide.genre_ids = rap.id
rockstar.genre_ids = rap.id
mask_off.genre_ids = rap.id

drake.save
malone.save
future.save