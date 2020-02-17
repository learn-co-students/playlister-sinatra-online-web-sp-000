class ArtistsController < ApplicationController
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  
  get '/artists' do
    @all_art = Artist.all
    erb :artist_index
  end
  
end
