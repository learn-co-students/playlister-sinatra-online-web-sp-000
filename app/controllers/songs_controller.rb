class SongsController < ApplicationController 

    get '/songs' do 
        @songs = Song.all 
        erb :'songs/index'
    end 

    get '/songs/new' do 
        @genres = Genre.all 
        erb :'songs/new'
    end 

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end 

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all 
        erb :'songs/edit'
    end 

    post '/songs' do 
        #create a new song
        @song = Song.create(name: params[:name])
        #set the song's genres
        params[:genres][:name].each do |genre_id|
            @song.genres << Genre.find_by_id(genre_id)
        end 
        #create a new artist if that artist does not exist 
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])

        @song.save 

        redirect "/songs/#{@song.slug}"
    end 

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params[:name])

        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])

        if !params["genres"]["name"].empty? 
            @song.genres = []

            params[:genres][:name].each do |genre_id|
                @song.genres << Genre.find_by_id(genre_id)
            end 
        end 

        redirect "/songs/#{@song.slug}"

    end 

end 