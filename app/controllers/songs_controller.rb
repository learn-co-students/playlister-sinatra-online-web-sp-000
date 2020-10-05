class SongsController < ApplicationController

    get "/songs" do
        @songs = Song.all
        erb :'songs/index'
    end

    post "/songs" do
        artist = Artist.find_by(name: params[:artist_name])
        
        if !artist
            artist = Artist.create(name: params[:artist_name])
        end

        new_song = Song.new(name: params[:song_name], artist: artist)
        
        params[:genres].each do |genre_id|
            genre = Genre.find(genre_id)
            new_song.genres << genre
        end
        
        new_song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{new_song.slug}"
    end

    get "/songs/new" do
        erb :'songs/new'
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch "/songs/:slug" do
        artist = Artist.find_by(name: params[:artist_name])
        
        if !artist
            artist = Artist.create(name: params[:artist_name])
        end

        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params[:song_name], artist: artist)
        @song.genres.clear

        params[:genres].each do |genre_id|
            genre = Genre.find(genre_id)
            @song.genres << genre
        end
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

end