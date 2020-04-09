# require 'sinatra/base'
# require "bundler/setup"
require "rack-flash"

class SongsController < ApplicationController
	enable :sessions
	use Rack::Flash

	get "/songs" do
		@songs = Song.all
		erb :"songs/index"
	end

	get "/songs/new" do
		@genres = Genre.all
		# binding.pry
		erb :"songs/new"
	end

	get "/songs/:slug" do
		@song = Song.find_by_slug(params[:slug])
		# binding.pry
		erb :"songs/show"
	end

	post "/songs" do
    # @song = Song.create(params[:song])     
    # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # @song.genre_ids = params[:genres]
    # @song.save 

    # flash[:message] = "Successfully created song." 
    # redirect("/songs/#{@song.slug}")


    @song = Song.create(name: params[:name])
    
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    # binding.pry
    @song.genres = Genre.find(params[:genres])

    @song.save

    flash[:message] = "Successfully created song." 
    redirect("/songs/#{@song.slug}")


		# name = params["name"]
		# artist = Artist.find_or_create_by(name: params["artist_name"])
		# genres = params["genres"].collect {|genre| Genre.find(genre)}
		# song = Song.create(name: name, artist: artist)
		# song.genres << genres

		# flash[:message] = "Successfully created song."
		# redirect "/songs/#{song.slug}"
	end

	get "/songs/:slug/edit" do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		# binding.pry
		erb :"songs/edit"
	end

	patch "/songs/:slug" do
		song = Song.find_by_slug(params[:slug])

		if !params[:name].empty?
			song.name = params[:name]
		end

		if !params[:artist_name].empty?
			song.artist = Artist.find_or_create_by(name: params[:artist_name])
		end

		song.genres.clear
		song.genres << params["genres"].collect {|genre| Genre.find(genre)}
    
		song.save

    flash[:message] = "Successfully updated song." 
		redirect "/songs/#{song.slug}"
	end
end




