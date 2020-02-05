class ArtistsController < ApplicationController
  get '/artists' do
    @songs = Artist.all
    erb :'/artists/index'
  end

  get 'artists/new' do
    Nothing yet
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
  erb :show
end
end
