class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/:slug' do
      
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    
    post '/songs' do
        binding.pry
        @song = Song.new(params[:song])
        
        if Artist.all.find {|artist| params[:artist][:name]==artist.name}
            @artist = Artist.all.find {|artist| params[:artist][:name]==artist.name}
        else 
            @artist = Artist.create(params[:artist])
        end

        @song.artist = @artist
        params[:genres].each do |genre_id|
            @song.genres << Genre.find(genre_id)
        end
        @song.save
    
        redirect "songs/#{@song.slug}"

    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
       
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist=Artist.find_or_create_by(name: params[:artist][:name])

        @song.genre_ids=params[:genres]
        # params[:genres].each do |genre_id|
        #     @song.genres << Genre.find(genre_id)
        # end
        @song.save

    redirect "songs/#{@song.slug}"

    end

    
end