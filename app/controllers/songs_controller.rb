require 'pry'
class SongsController < ApplicationController 
  
  get '/songs' do 
    params
      #binding.pry 
    erb :'/songs/index' 
  end 
  
  
end 