class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all
        erb :"/artists/index"
      end

      get '/artists/:slug' do
        artist = params[:slug]
        @artists = Artist.find_by_slug(artist)
        # binding.pry
        erb :"/artists/show"
      end
end
