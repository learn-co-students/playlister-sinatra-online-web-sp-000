class SongsController < ApplicationController

	use Rack::Flash

	get '/songs' do
		# binding.pry
		@items = Song.all
    erb :index
  end

  get '/songs/new' do
  	@genres = Genre.all
  	@artists = Artist.all
		erb :'songs/new'
  end


  get '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
  	@genres = Genre.all

		erb :'songs/edit'
  end

  get '/songs/:slug' do
  	# binding.pry
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
  end

  post '/songs' do
  	# binding.pry
  	@song = Song.create(params[:song])     
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save 

    flash[:message] = "Successfully created song."
		redirect :"/songs/#{@song.slug}"
  end

  patch '/songs/:id' do
  	# binding.pry

  	@song= Song.find(params[:id])
  	@song.update(params[:song])     
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save 

		flash[:message] = "Successfully updated song."
		redirect :"/songs/#{@song.slug}"
  end

end

