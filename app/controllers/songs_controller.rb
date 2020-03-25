class SongsController < ApplicationController

   get '/songs' do 
      # presents the user with list of all songs
      # as clickable links to that song's show page
   end 
   ## Pay attention to the order of /songs/new and /songs/:slug. 
   ## The route /songs/new could interpret new as a slug if that 
   ## controller action isn't defined first.

   get '/songs/:slug' do 
      # song's show page should have links to that 
      # song's artist and the each genre associated 
      # with the song.
   end 

end 