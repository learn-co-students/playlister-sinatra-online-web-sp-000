require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
 enable :sessions
	use Rack::Flash

	# => create
	get '/songs/new' do
		erb :'songs/new'
	end

	post '/songs' do
		@song = Song.create(params[:song])

		params[:genres].each do |genre_id|
			@song.genres << Genre.find(genre_id)
		end

		if artist = Artist.find_by(params[:artist])
			@song.artist = artist
		else
			@song.artist = Artist.create(params[:artist])
		end


		@song.save
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end

	# => read
	get '/songs' do
		@songs = Song.all

		erb :'songs/index'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end

	# => update
	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song.update(params[:song])

		if @song.genres
			@song.genres.clear
		end

		params[:genres].each do |genre_id|
			@song.genres << Genre.find(genre_id)
		end

		if artist = Artist.find_by(params[:artist])
			@song.artist = artist
		else
			@song.artist = Artist.create(params[:artist])
		end

		@song.save
		flash[:message] = "Successfully updated song."
		redirect "/songs/#{@song.slug}"
	end

end