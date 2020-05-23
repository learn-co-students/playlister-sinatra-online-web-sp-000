class GenresController < ApplicationController
	get '/genres' do
		@items = Genre.all
    erb :index
  end

  get '/genres/:slug' do
  	# binding.pry
		@genre = Genre.find_by_slug(params[:slug])
		erb :'genres/show'
  end
end
