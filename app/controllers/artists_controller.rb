class ArtistsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/artists/") }

  get '/artists' do
    @artists = Artist.all

    erb :all
  end

  #get '/artists/new' do
  #  @genres = Genre.all

  #  erb :new
  #end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    erb :show
  end

  def convert_slug_to_string(slug)
    #slug.split("-").map(&:capitalize).join(' ')
    slug.tr("-", " ")
  end
end
