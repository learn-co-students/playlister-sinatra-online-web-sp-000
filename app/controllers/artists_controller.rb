class ArtistsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:id' do
    if Artist.find { |artist| artist.id == params[:id] }
      @artist = Artist.find(params[:id])
    else
      @artist = Artist.find_by_slug(params[:id])
    end

    erb :'artists/show'
  end
end
