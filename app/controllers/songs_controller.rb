require 'pry'
class SongsController < ApplicationController 
  
  get '/songs' do 
    @songs = Song.all 
    #binding.pry 
    erb :'/songs/index' 
  end 
  
  get 'songs/new' do 
    erb :'/songs/new'
  end 
  
  
end 