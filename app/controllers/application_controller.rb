require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs/new' do 
    erb :new
  end 
  
  post '/songs' do 
    song = Song.new(name: params[:name])
    song.artist = Artist.find_or_create_by(name: params[:artist])
    params[:genres].each {|genre| song.genres << Genre.find(genre)}
    song.save
    flash[:message] = "Successfully created song."
    
    redirect to "/songs/#{song.slug}"
  end 
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end
  
  patch '/songs/:slug' do 
    #binding.pry
    flash[:message] = "Successfully updated song."
    song = Song.find_by_slug(params[:slug]) 
    song.artist = Artist.find_or_create_by(name: params[:artist]) if !params[:artist].empty?
    params[:genres].each {|genre| song.genres << Genre.find(genre)} if params[:genres]
    song.save
    
    redirect "/songs/#{song.slug}"
  end 

  get '/:model' do
    path = get_path
    @class_model = get_model(path)
    
    erb :index
  end
  
  get '/:model/:slug' do 
    slug = get_slug
    class_model = get_class_model
    @model = class_model.find_by_slug(slug)
    
    erb :show
  end
  
  
  helpers do 
    def get_path 
      request.path_info.gsub(/.\z/, "").gsub("/", "").capitalize
    end
    
    def get_model(path) 
      path.classify.constantize
    end
    
    def get_slug 
      request.path_info.gsub(/(\/.*\/)/, "")
    end
    
    def get_class_model 
      request.path_info.match(/(\/.*\/)/).to_s.gsub("/", "").classify.constantize
    end
  end 
end