class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    #{}"A list of sweet songs"
    erb :'/songs/index'
  end

  #show specific song page
  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
