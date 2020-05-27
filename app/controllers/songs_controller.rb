class SongsController < Sinatra::Base
  enable :sessions
  configure do
    set :views, 'app/views/songs'
  end
    get '/songs' do
      @songs = Song.all
      erb :index
    end

    post '/songs' do
      @song = Song.create(:name => params["Name"])
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save

      session[:success_message] = "Successfully created song."

      redirect "/songs/#{@song.slug}", locals: {message: "Successfully created song."}
    end

    get '/songs/new' do

      erb :new
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])

      erb :edit
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @success_message = session[:success_message]
      session[:success_message] = nil
      erb :show
    end

    patch '/songs/:slug' do

      @song = Song.find_or_create_by(:name => params["Name"])
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save
      session[:success_message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
    end
end