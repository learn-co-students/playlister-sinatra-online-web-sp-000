class ArtistsController < ApplicationController
  get '/artists' do
    erb :'artists/index'
  end

  get '/artists/:artist_name' do
    @artist = Artist.find_by_slug(params[:artist_name])
    erb :'artists/show'
  end
end
