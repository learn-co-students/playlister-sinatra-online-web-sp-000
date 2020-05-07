require 'rack-flash'


class SongsController < Sinatra::Base
    enable :sessions
    use Rack::Flash
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
  
    get '/songs' do
        @songs = Song.all
      erb :"/songs/index"
    end

    get '/songs/new' do
      @genres = Genre.all
      erb :"/songs/new"
    end

    post '/songs' do
      @song = Song.create(:name => params["Name"])
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save

      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"

    end

    get '/songs/:slug' do
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"/songs/edit"
  end

  # post '/songs/:slug' do 
  #     #"Hello World"
  #    binding.pry
  #     @song = Song.find_by_slug(params[:slug])
  #     @song.update = params[:song]
  #     @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

  #     # @genres = Genre.find(params[:genres])
  #     # @song.song_genres.clear
  #     # @genres.each do |genre|
  #     #   song_genre = SongGenre.new(:song => @song, :genre => genre)
  #     #   song_genre.save
  #     # end
  #     @song.save

  #     flash[:message] = "Successfully updated song."

  #     redirect "/songs/#{@song.slug}"
  # end

end
