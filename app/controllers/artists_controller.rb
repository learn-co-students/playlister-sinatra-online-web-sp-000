class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"/artist/index"
  end

  get '/artists/new' do

  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artist/show"
  end

  get '/artists/:slug/edit' do

  end

  post '/artists' do

  end

  patch '/artists/:slug' do

  end

  delete '/artists/:slug' do

  end
end
