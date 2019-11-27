class ArtistController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :index
  end
end
