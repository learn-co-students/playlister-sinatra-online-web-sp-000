class GenresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/genres/") }

  get '/genres' do
    @genres = Genre.all

    erb :all
  end

  #get '/artists/new' do
  #  @genres = Genre.all

  #  erb :new
  #end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :show
  end
end
