
class SongsController < ApplicationController

  get'/songs/new' do
    @genres = Genre.all
    erb :'songs/new'  
  end

  post '/songs' do
    
    @artist = Artist.find_by(name: params["Artist Name"])
    ##if artist doesn't exist
    if @artist.nil?
      @artist = Artist.create(name: params["Artist Name"])
      @song = Song.create(name: params[:Name], :artist => @artist)
        params[:song][:genre_name].each do |genre|
          genre_id = Genre.find_by(name: genre).id
          SongGenre.create(song_id: @song.id, genre_id: genre_id)
        end
      else
        @song = Song.create(name: params[:Name], :artist => @artist)
        params[:song][:genre_name].each do |genre|
          genre_id = Genre.find_by(name: genre).id
          SongGenre.create(song_id: @song.id, genre_id: genre_id)
        end
    end
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug.downcase}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
     if params["Artist Name"] != @artist.name
      @song.artist.update_attribute(:name, params["Artist Name"])
      if !((params["genre_names"].length == @song.genres.length) && (params["genre_names"].sort == @song.genres.sort))
         @song.update_genres(params["genre_names"])
       end
     end
    
    if !((params["genre_names"].length == @song.genres.length) && (params["genre_names"].sort == @song.genres.sort))
      @song.update_genres(params["genre_names"])
    end
  
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
end
