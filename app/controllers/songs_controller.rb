class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end
    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @artists = Artist.all
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    post '/songs' do
        
        
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(params[:artist])
        
        flash[:message] = "Successfully created song."

        @song.save
        redirect to "/songs/#{@song.slug}"
    end
    patch '/songs/:slug' do
        #binding.pry
        artist = Artist.find_or_create_by(params[:artist])
        song = Song.find_by_slug(params[:slug])
        song.update(name: params[:song][:name], artist: artist, genre_ids: params[:genres])

        flash[:message] = "Successfully updated song."

        redirect "/songs/#{song.slug}"
    end

end
