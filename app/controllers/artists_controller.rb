class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all

        erb :'artists/index'
    end

    get '/artists/:slug' do
        @artist = Slugify.find_by_slug(Artist, params[:slug])
        
        erb :'artists/show'
    end
end
