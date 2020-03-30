class SongsController < ApplicationController

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
      @song = Song.create(name: params["song"]["name"])
      if !params["artist"].empty?
         @song.artists << Artist.create_or_find_by(name: params["artist"])
      end 

      redirect :"/songs/#{@song.slug}"
   end 

   get '/songs/:slug' do 
      # song's show page should have links to that 
      # song's artist and the each genre associated 
      # with the song.
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
   end


end 