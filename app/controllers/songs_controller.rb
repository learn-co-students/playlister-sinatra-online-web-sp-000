class SongsController < ApplicationController

  get '/songs' do
    binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

end
