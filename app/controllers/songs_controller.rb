require 'rack-flash'

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

    post '/songs' do
        # binding.pry
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song = Song.create(name: params[:song_name], artist_id: @artist.id)
        Genre.all.each do |genre|
            if params[:genres].include?(genre.id.to_s)
                @song.genres << genre
            end
        end
        @song.save

        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"    
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show' 
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :'/songs/edit'        
    end

    patch '/songs/:slug' do
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.artist = @artist
        @song.genres.clear
        Genre.all.each do |genre|
            if params[:genres].include?(genre.id.to_s)
                @song.genres << genre
            end
        end
        @song.save

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end
end