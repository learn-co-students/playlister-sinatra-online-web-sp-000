class ArtistsController < ApplicationController

  get '/artists' do 
    @artists = Artist.all
	erb :'artists/index'
  end

  get 'artist/new' do
  	erb :'artists/new'
  end

  post 'artist' do
  	@artist = Artist.create(name: params[:name])
  	redirect to 'artists/#{@artist.slug}'
  end

  get '/artists/:slug' do
  	#binding.pry
	@artist = Artist.find_by_slug(params[:slug])  
  	erb :'artists/show'
  end

end
