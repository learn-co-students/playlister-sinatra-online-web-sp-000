class GenresController < ApplicationController 

   get '/genres' do 
      # presents the user with a list of all genres 
      # as clickable links to that genre's show page
   end 

   get '/genres/:slug' do 
      # genre's show page should have links to each of 
      # its artists and songs.
   end 

end 