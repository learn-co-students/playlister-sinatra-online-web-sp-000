require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end


  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/songs/:slug' do
    slug = params[:slug]
    show = Song.find_by_slug(slug)
    # binding.pry
    redirect '/songs/show'
  end

end