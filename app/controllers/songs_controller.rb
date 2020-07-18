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
    
    get '/songs/:slug' do
        
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

  

    post '/songs' do
     
        if Artist.ci_find('name', params[:artist][:name]).name == "Artist"
            params[:song][:artist_id] =  Artist.create(name: params[:artist][:name]).id
        else 
            params[:song][:artist_id] = Artist.ci_find('name', params[:artist][:name]).id
        end

        @song = Song.create(params[:song])

        flash[:message] = "Successfully created song."

        redirect to "/songs/#{@song.slug}"

    end

    get '/songs/:slug/edit' do 
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        if Artist.ci_find('name', params[:artist][:name]).name == "Artist"
            params[:song][:artist_id] =  Artist.create(name: params[:artist][:name]).id
        else 
            params[:song][:artist_id] = Artist.ci_find('name', params[:artist][:name]).id
        end
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        flash[:message] = "Successfully updated song."
       
        redirect to "/songs/#{@song.slug}"
    end

end