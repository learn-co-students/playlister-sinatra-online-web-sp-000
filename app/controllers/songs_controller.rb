class SongsController < ApplicationController

  get '/songs' do
    binding.pry
    @songs = Song.all
    #{}"A list of sweet songs"
    erb :'/songs/index'
  end

  #show specific song page
  get '/songs/:id' do
  #  binding.pry
    @song = Song.find_by_slug(params[:id])
    erb :'/songs/show'
  end

end
