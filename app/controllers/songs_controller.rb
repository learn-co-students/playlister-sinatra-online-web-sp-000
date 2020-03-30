require 'rack-flash'

class SongsController < ApplicationController
   use Rack::Flash
   get '/songs' do 
      # presents the user with list of all songs
      @songs = Song.all 
      # as clickable links to that song's show page
      erb :'/songs/index'
   end 
   ## Pay attention to the order of /songs/new and /songs/:slug. 
   ## The route /songs/new could interpret new as a slug if that 
   ## controller action isn't defined first.
   get '/songs/new' do 
      #@songs = Song.all
      erb :'/songs/new'
   end 

   post '/songs' do 
      #binding.pry
      @song = Song.new(name: params["song_name"])
      @song.artist = Artist.find_or_create_by(name: params["artist_name"])

      params[:genre_ids].each do |genre_id|
         @song.genres << Genre.find_by_id(genre_id)
      end 
      @song.save 
      flash[:message] = "Successfully created song."
  
      redirect to :"/songs/#{@song.slug}"
   end 

   get '/songs/:slug' do 
      # song's show page should have links to that 
      # song's artist and the each genre associated 
      # with the song.
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
   end


end 