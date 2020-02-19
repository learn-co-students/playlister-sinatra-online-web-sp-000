class ArtistsController < ApplicationController
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  
  get '/artists' do
    @all_art = Artist.all
    erb :artist_index
  end
  
  get '/artists/:slug' do
    @slug = params[:slug]
    @slug_artist = Artist.find_by_slug(@slug)
    erb :artist_slug
  end
  
end
