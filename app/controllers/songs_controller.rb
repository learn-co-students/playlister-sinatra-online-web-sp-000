

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by(slug: params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do
        # set some initial variables
        artists = Artist.all
        @song = Song.new(name: params[:song][:name])
        # Set or create artist
        if artists.find{|artist| artist.name == params[:song][:artist]}
            @song.artist = Artist.find{|artist| artist.name == params[:song][:artist]}
        else
            @song.artist = Artist.create(name: params[:song][:artist])
        end

        # set Genres
        params[:genres].each do |genre|
            @song.genres << Genre.find(genre)
        end
        @song.set_slug
        @song.save
  
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by(slug: params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        # set some initial variables
        @song = Song.find_by(slug: params[:slug])
        artists = Artist.all
        # binding.pry
        # Set or create artist
        if artists.find{|artist| artist.name == params[:song][:artist]}
            @song.artist = Artist.find{|artist| artist.name == params[:song][:artist]}
        else
            @song.artist = Artist.create(name: params[:song][:artist])
        end

        # set Genres
        @song.genres = []
        params[:genres].each do |genre|
            @song.genres << Genre.find(genre)
        end
        @song.set_slug
        @song.save

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

end