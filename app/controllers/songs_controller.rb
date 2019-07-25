


class SongsController < ApplicationController
use Rack::Flash
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name:params[:artist_name])
    @song.update(artist:@artist)
    flash[:message]="Successfully updated song."
    redirect :"songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if !params[:artist_name].empty?
      @artist = Artist.find_or_create_by(name:params[:artist_name])
      @song.update(artist:@artist)
    end
    flash[:message]="Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end
end
