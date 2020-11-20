class ArtistController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :"artists/artists"
    end

    get '/artists/new' do
        erb :"artists/new"
    end

    get "/artists/:slug" do
        @artist = Artist.find_by_slug(params[:slug])
        @songs = @artist.songs
        erb :"artists/slug"
    end
end
