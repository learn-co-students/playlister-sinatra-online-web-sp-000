class ArtistsController < ApplicationController

   get '/artists' do 
      # presents the user with a list of all artists 
      # as clickable links to that song's show page
      #binding.pry
      @artists = Artist.all 
      erb :'/artists/index'
   end 

   get '/artists/:slug' do 
      # artist's show page should have links to each 
      # of his or her songs and genres.
      @artist = Artist.find_by_slug(params[:slug])
      #binding.pry 
      erb :'/artists/show'
   end 
end
