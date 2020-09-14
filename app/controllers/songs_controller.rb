require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :"/songs/index"
    end

    get "/songs/new" do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do
        @song = Song.create(:name => params[:song][:name])
    
        artist_entry = params[:song][:artist]
        if Artist.find_by(:name => artist_entry)
          artist = Artist.find_by(:name => artist_entry)
        else
          artist = Artist.create(:name => artist_entry)
        end
        @song.artist = artist
    
        genre_selections = params[:song][:genres]
        genre_selections.each do |genre|
          @song.genres << Genre.find(genre)
        end
    
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    
        
end