
# require 'sinatra/flash'
# enable :sessions

class SongsController < ApplicationController 
  
  
  

  
  
 
   get '/songs' do
     @songs = Song.all
     erb :'songs/index'
   end
 
   get '/songs/new' do
     erb :'songs/new'
   end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
 
   post '/songs' do
     @song = Song.create({name: params[:name]})
     @song.artist = Artist.find_or_create_by(name: params[:artist_name])
     @song.genre_ids = params[:genres]
     #@song.genres << params[:genres].collect {|g| Genre.find(g)}
     @song.save
     binding.pry 
     

 
     #flash[:message] = "Successfully created song."
     redirect to "/songs/#{@song.slug}"
     erb :"/songs/show", :locals => {:message => "Successfully created song."}
   end
 
   get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/edit'
   end
 
  
 
   patch '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @song.update(params[:song])
     @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.genre_ids = params[:genres]
     @song.save

    #flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
    
    erb :'songs/show', :locals => {:message => "Successfully updated song."}
   end
   
  
 end
