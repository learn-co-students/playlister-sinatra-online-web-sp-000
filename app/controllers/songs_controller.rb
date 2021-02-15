require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
 

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(:name => params[:song][:name])
        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
            artist = Artist.find_by(:name => artist_name)
        else
            artist = Artist.create(:name => artist_name) 
        end
        @song.artist = artist

        song_genres = params[:song][:genres]
        song_genres.each do |genre|
            @song.genres << Genre.find(genre)
        end

        @song.save

        flash[:message] = "Successfully created song."
        redirect to("songs/#{@song.slug}")
    end


    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        
        if !params[:song][:name].empty?
            @song.name = params[:song][:name]
        end

        if !params[:song][:artist].empty?
            artist_name = params[:song][:artist]
            if Artist.find_by(:name => artist_name)
                artist = Artist.find_by(:name => artist_name)
            else
                artist = Artist.create(:name => artist_name) 
            end
            @song.artist = artist
        end

        song_genres = params[:song][:genres]
        @song.genres.clear
        song_genres.each do |genre|
            @song.genres << Genre.find(genre)
        end
        
        @song.save

        flash[:message] = "Successfully updated song."
        redirect to("songs/#{@song.slug}")
    end

end
        
        

