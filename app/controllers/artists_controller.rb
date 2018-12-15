class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artists.all
    erb :'/artists/index'
  end

end
