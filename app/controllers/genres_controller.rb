class GenresController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    @genres = Genre.all

    erb :'genres/index'
  end

  get '/genres/:id' do
    if Genre.find { |genre| genre.id == params[:id] }
      @genre = Genre.find(params[:id])
    else
      @genre = Genre.find_by_slug(params[:id])
    end

    erb :'genres/show'
  end
end
