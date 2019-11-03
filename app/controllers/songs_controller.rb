
class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])

    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end

    if params[:song][:genre_name] != nil
      params[:song][:genre_name].each do |name|
        @song.genres << Genre.find_by(name: name)
      end
    end

    @song.save

    #puts song.name
    #params[:created] = "Exists."

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    #@updated = false #successfully updated song indicator
    #@created = false #successfully created song indicator
    #if params[:created]
    #  @created = true
    #elsif params[:updated]
    #  @updated = true
    #end
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    if @song.artist_id != nil
      @artist = Artist.find(@song.artist_id)
    end
    if @song.genre_id != ""
      @genres = Genre.all
    end
    #@artist = @song.artist
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    if params[:artist][:name] != ""
      @song.artist = Artist.create(name: params[:artist][:name])
    end

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{ @song.slug }"
  end
end
