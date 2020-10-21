require 'rack-flash'

class ArtistsController < ApplicationController
  extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    enable :sessions
    use Rack::Flash

    get '/artists' do
        @artists = Artist.all
        erb :'artists/index'
      end

      get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        # binding.pry
        erb :'artists/show'
    end

      get '/artists/new' do
        erb :'artists/new'
      end

  
end
