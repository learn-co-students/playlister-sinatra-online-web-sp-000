require 'rack-flash'

class SongsController < ApplicationController
	use Rack::Flash

	get '/songs' do
		@songs = Song.all
		erb :'songs/index'
	end

	get '/songs/new' do
		@genres = Genre.all
		erb :'/songs/new'
	end	

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	post '/songs' do
		@song = Song.create(params[:song])
		@artist = Artist.find_or_create_by(name: params[:artist][:name])
		@song.artist = @artist
		@song.genre_ids = params[:genres]
		@song.save
		
		
		flash[:message] = "Successfully created song."
		redirect("/songs/#{@song.slug}")
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		erb :'/songs/edit'
	end

	patch '/songs/:slug' do
		#get original song
		@song = Song.find_by_slug(params[:slug])

		#udpate base parameters to new song by name
		@song.update(params[:song])

		#get artist updated
		if params[:artist][:name].empty?
			@artist = @song.artist
		else
			@artist = Artist.find_or_create_by(name: params[:artist][:name])
			@song.artist = @artist
		end

		#get genres updated
		@song.genre_ids = params[:genres]

		#save all to DB
		@song.save

		flash[:message] = "Successfully updated song."
		redirect("/songs/#{@song.slug}")
	end

	
	

end