require 'rack-flash'

class SongsController < ApplicationController

  extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    enable :sessions
    use Rack::Flash
  
    #### CREATE #######

    get '/songs/new' do
      @artists = Artist.all 
      @songs = Song.all 
      @genres = Genre.all
      erb :'songs/new'
    end

    post '/songs' do
      #create song
      @song = Song.create(name: params[:song][:name])
      #assign artist
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
      # binding.pry
      @song.save
      flash[:message] = "Successfully created song."

      redirect "songs/#{@song.slug}"
  end

    ####### READ ########

    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
      end


      get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        flash[:message] = "Successfully created song."
        # # binding.pry
        erb :'songs/show'
      end

      ####### UPDATE
      get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist 
        @genres = Genre.all 
        erb :'songs/edit'
      end

      patch '/songs/:slug' do 
        
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        @song.update(params[:song])
        
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        
        @song.genres_id = params[:genre_ids]
        # @song.genres = Genre.find_or_create_by(genre_ids: params[:genre_ids])
      #  binding.pry
        # params[:genre_ids].each do |genre_id|
        #     @genres = Genre.find_by(genre_ids: params[genre_ids])
        #     @song.genres << genre
        # end
        
        @song.save
        flash[:message] = "Successfully updated song."
        
        redirect "/songs/#{@song.slug}"
      end
end
