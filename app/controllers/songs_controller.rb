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

      erb :'/songs/new'
   end 

   get '/songs/:slug' do 
      # song's show page should have links to that 
      # song's artist and the each genre associated 
      # with the song.
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
   end 

   post '/songs/new' do 
      @song = Song.create(name: params["name"])
      erb :'/songs/:slug'
   end 

end 