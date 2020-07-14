require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  def song_fill(song, update, string)
    song.update(params[:song]) if update
    song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.genre_ids = params[:genres]
    song.save
    flash[:message] = "Successfully #{string} song."
    redirect("/songs/#{song.slug}")
  end

  get('/songs') {@songs=Song.all; erb :'/songs/index'}
  get('/songs/new') {erb :'/songs/new'}
  get('/songs/:slug') {@song=Song.find_by_slug(params[:slug]); erb :'songs/show'}
  get('/songs/:slug/edit') {@song=Song.find_by_slug(params[:slug]); erb :'songs/edit'}
  post('/songs') {song_fill(Song.create(params[:song]), false, "created")}
  patch('/songs/:slug') {song_fill(Song.find_by_slug(params[:slug]), true, "updated")}

end
