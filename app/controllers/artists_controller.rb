class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :artists
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        #binding.pry
        erb :artist_show
    end
end
