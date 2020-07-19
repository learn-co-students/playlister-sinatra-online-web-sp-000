require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        #select the song and then the artist associated with the song
        #song.genres
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do
       @song = Song.create(:name => params[:song][:name])
       
       artist = params[:song][:artist]
       if Artist.find_by(:name => artist)
        artist = Artist.find_by(:name => artist)
       else
        artist = Artist.create(:name => artist)
       end
       @song.artist = artist

       genre_select = params[:song][:genres]
       genre_select.each do |genre|
        @song.genres << Genre.find(genre)
       end

       @song.save
       flash[:message] = "Successfully created song."
        redirect "songs/#{@song.slug}"

    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
        
        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
            if song.artist.name != artist_name
                song.artist = Artist.find_by(:name => artist_name)
            end
        else
            song.artist = Artist.create(:name => artist_name)
        end

        if song.genres
            song.genres.clear
          end
          genres = params[:song][:genres]
          genres.each do |genre|
            song.genres << Genre.find(genre)
          end
      
          song.save
          flash[:message] = "Successfully updated song."
          redirect to "songs/#{song.slug}"
    end

    get '/songs/:slug/edit' do
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :"songs/edit"
        
    end

end