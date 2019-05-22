class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find{|a|a.slug == params[:slug]}

    erb :'/artists/show'
  end


end
