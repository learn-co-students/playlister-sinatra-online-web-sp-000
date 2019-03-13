#class SongsController < ApplicationController

#  get "/songs" do
#    @songs = Song.all
#    erb :"songs/index"
#  end

#  get "/songs/new" do
#    erb :"songs/new"
#  end

#  get "/songs/:slug" do
#    @song = Song.find_by_slug(params[:slug])
#    erb :"songs/show"
#  end

#  post "/songs" do
#    @song = Song.create(:name => params["Name"])
#    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
#    @song.genre_ids = params[:genres]
#    @song.save
#    redirect :"songs/#{@song.slug}"
#  end

#  get "/songs/:slug/edit" do
#    @song = Song.find_by_slug(params[:slug])
#    erb :"songs/edit"
#  end

#  patch '/songs/:slug' do
#    @song = Song.find_by_slug(params[:slug])

#    @song.update(params[:song])

#    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
#    @song.save

#    erb :'songs/show', locals: {message: "Successfully updated song."}
#  end

#end




require 'sinatra/base'
#require 'rack-flash'

class SongsController < Sinatra::Base
  enable :sessions
#  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])

    artist_entry = params[:song][:artist]
    artist = Artist.find_or_create_by(:name => artist_entry)
#    if Artist.find_by(:name => artist_entry)
#      artist = Artist.find_by(:name => artist_entry)
#    else
#      artist = Artist.create(:name => artist_entry)
#    end
    @song.artist = artist

    genre_selections = params[:song][:genres]
    genre_selections.each do |genre|
      @song.genres << Genre.find(genre)
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"

  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/show"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name]

    artist_name = params[:song][:artist]
    if Artist.find_by(:name => artist_name)
      if song.artist.name != artist_name
        song.artist = Artist.find_by(:name => artist_name)
      end
    else
      song.artist = Artist.create(:name => artist_name)
    end

    if song.genres
      song.genres.clear
    end
    genres = params[:song][:genres]
    genres.each do |genre|
      song.genres << Genre.find(genre)
    end

    song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/edit"
  end
end
