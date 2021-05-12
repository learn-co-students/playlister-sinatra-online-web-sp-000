class SongsController < ApplicationController

    get '/songs' do
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @message = ""
        @song = Song.find_by_slug(params[:slug]) 
        song_genres = SongGenre.where(song_id: @song.id)
        @genres = song_genres.map {|song_genre| Genre.find(song_genre.genre_id)}
        erb :'songs/show'
    end

    post '/songs' do
        new_song = Song.create(name: params[:Name])
        if existing_artist = Artist.find_by(name: params["Artist Name"])
            new_song.artist = existing_artist
        else
            associated_new_artist = Artist.create(name: params["Artist Name"])
            new_song.artist = associated_new_artist
        end
        new_song.genres = params[:genres].map {|genre_id| Genre.find(genre_id)}
        new_song.save
        session[:message] = "Successfully created song."
        redirect "/songs/#{new_song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        edited_song = Song.find_by_slug(params[:slug])
        new_genres = params[:genres].map {|genre_id| Genre.find(genre_id)}
        new_genres.each do |genre|
            edited_song.genres << genre
        end
        edited_song.update(artist: Artist.create(name: params["Artist Name"]))
        edited_song.save
        session[:message] = "Successfully updated song."
        redirect "/songs/#{edited_song.slug}"
    end

end