class SongsController < ApplicationController
   get '/songs' do
      erb :'/songs/index.erb'
   end
end