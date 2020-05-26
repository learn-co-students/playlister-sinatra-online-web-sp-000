class SongsController < Sinatra::Base
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

      redirect "/songs/#{@song.slug}", locals: {message: "Successfully created song."}
    end

    get '/songs/new' do

      erb :new
    end

    get '/songs/:slug/edit' do
      @song = Song.find {|song| song.slug == "#{params[:slug]}"}
      erb :edit
    end

    get '/songs/:slug' do
      @song = Song.find {|song| song.slug == "#{params[:slug]}"}
      erb :show
    end
end