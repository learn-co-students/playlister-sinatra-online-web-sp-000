class SongsController < ApplicationController
  get "/songs" do
    erb :'songs/index'
  end
  get "/songs/new" do
    erb :'songs/new'
  end
  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @success = nil
    if session[:success]
      @success = session[:success]
      session.clear
    end
    erb :'songs/show'
  end
  post "/songs" do
    @song = Song.new(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.save
    session[:success] = "new"
    redirect "/songs/#{@song.slug}"
  end
  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end
  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.genres = []
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.save
    session[:success] = "updated"
    redirect "/songs/#{@song.slug}"
  end
end
