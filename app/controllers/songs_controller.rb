require 'rack-flash'
require 'pry'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genre = Genre.all
     erb :'/songs/new'
   end

   get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/show'
    end


   post '/songs' do
    # binding.pry
       @genre = Genre.all
       @song = Song.create(:name => params[:song_name])
       #@song.update(params[:song_name])
       @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
       @song.genre = params[:genre_name]
       if !params[:artist_name].empty?
          @song.artist = Artist.create(:name => params[:artist_name])
       end
       @song.save
       flash[:message] = "Successfully created song."
       redirect("/songs/#{@song.slug}")
    end




    #get '/songs/:slug/edit' do
    #  @song = Song.find_by_slug(params[:slug])
    #  erb :'songs/edit'
    #end

     #patch '/songs/:slug' do




end
