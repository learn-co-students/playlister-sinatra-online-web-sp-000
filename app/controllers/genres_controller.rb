require 'sinatra/base'
require 'rack-flash'

class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

    get '/genres' do
      #present the user with a list of all genres in library
      #each genre should be clickable link to that particular genre's show page
      @genres = Genre.all
      erb :'genres/index'
    end

    get '/genres/:slug' do
      slug = params[:slug]
      @genre = Genre.find_by_slug(slug)
      erb :"genres/show"
    end
  
  end