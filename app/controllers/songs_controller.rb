
class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @new_song = Song.create(name: params[:song][:name])
        params[:genre].each do |genre|
            id = Genre.find(genre)
            @new_song.genres << id
        end
        if Artist.find_by(name: params[:artist][:name]) == nil
            @new_artist = Artist.create(name: params[:artist][:name])
            @new_song.artist = @new_artist
        else
            @new_song.artist = Artist.find_by(name: params[:artist][:name])
        end
        @new_song.save
        flash[:message] = "Successfully created song."
        redirect to "songs/#{@new_song.slug}"
    end


    get '/songs/:slug' do
        # @song = Song.all.find do |song|
        #     song.slug == params[:slug]
        # end
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs//edit'
    end

    patch '/songs/:slug' do
        
        @song_edit = Song.find_by_slug(params[:slug])
        @song_edit.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song_edit.genres.clear
        params[:genre].each do |genre|
            id = Genre.find(genre)
            @song_edit.genres << id
        end
        @song_edit.save
        flash[:message] = "Successfully updated song."
        redirect to "songs/#{@song_edit.slug}" 
    end


end