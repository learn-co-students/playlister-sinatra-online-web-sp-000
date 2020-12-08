require 'rack-flash'

class ArtistsController < ApplicationController
  use Rack::Flash

  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

end
