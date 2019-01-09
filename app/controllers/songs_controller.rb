class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    @artist = Artist.find_by(name: params["Artist Name"])
    if !!@artist
      @song = Song.new(name: params[:Name])
      @song.artist = @artist
      @genre = Genre.find_by(name: params[:genres])
      @song.genres << @genre
      @song.save
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song = Song.new(name: params[:Name])
      @song.artist = @artist
      @genre = Genre.find_by(name: params[:genres])
      @song.genres << @genre
      @song.save
    end

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do
    @song = Song.find {|song| song.slug == params[:slug]}
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find {|song| song.slug == params[:slug]}
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find {|song| song.slug == params[:slug]}
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

    @genres = Genre.find(params[:genres])
    @song.song_genres.clear
    @genres.each do |genre|
      song_genre = SongGenre.new(:song => @song, :genre => genre)
      song_genre.save
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
