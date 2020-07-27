require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash
    get '/songs' do 
        erb :'/songs/index'
    end 

    get '/songs/new' do 
        erb :'/songs/new'
    end 

    get '/songs/:slug' do 
        erb :'/songs/show'
    end 

    post '/songs' do
        @song = Song.create(params[:song])     
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save 
        # binding.pry

        flash[:message] = "Successfully created song."
        redirect to("/songs/#{@song.slug}")
    end


end