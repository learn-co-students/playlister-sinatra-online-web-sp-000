#Run the following on the terminal to see what tests you have to pass
#rspec spec/models/01_artist_spec.rb

#Then run rake db:migrate SINATRA_ENV=test

#To make migrations, you do "rake db:create_migration NAME=create_artists"
#=> 20200128183325_create_artists.rb

#To seed the database do "rake db:seed"
