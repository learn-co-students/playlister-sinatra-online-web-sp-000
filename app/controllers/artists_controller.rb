class ArtistsController < ApplicationController

  get '/artists' do
    @all_artists = Artist.all
    erb :artists_index
  end

end
