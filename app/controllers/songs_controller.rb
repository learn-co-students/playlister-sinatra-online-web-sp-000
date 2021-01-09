class SongsController < ApplicationController
    require 'rack-flash'
    use Rack::Flash

    get '/songs' do
        @songs = Song.all.sort_by {|song| song.name}

        erb :'/songs/index'
    end

    post '/songs' do
        song = Song.create(params[:song])
        if !params[:artist][:name].empty?
            song.artist = Artist.find_or_create_by(name: params[:artist][:name])
            song.save
        end

        flash[:message] = "Successfully created song."
        redirect "/songs/#{song.slug}"
    end

    get '/songs/new' do
        @genres = Genre.all

        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])

        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all

        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        if !params[:song].keys.include?("genre_ids")
            params[:song][:genre_ids] = []
        end
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])

        if !params[:artist][:name].empty?
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.save
        end

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end
end