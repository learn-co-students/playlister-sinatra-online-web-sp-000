
require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash


    get '/songs' do
        @songs = Song.all 
        
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        #check out the params structure first before doing anything

        #1. create song with name
            @song = Song.create(name: params[:song][:name])
        #2. assign genres 
            params[:genre_ids].each do | genreid |
                thegenre = Genre.find_by(id: genreid)
                @song.genres << thegenre
            end
        
        #3. assign artist
            
            artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.artist = artist
        #4. save 
            #since song is the minor in the relationship, if u dont save these things, they wont get persisted to the databse
            #like artist wont be persisted for sure, for genres not sure
            @song.save
            artist.save
        #5. announce
            flash[:message] = "Successfully created song."
            #
        redirect "/songs/#{@song.slug}"
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
        #{"_method"=>"patch", "song"=>{"name"=>"Skylark"}, "artist"=>{"name"=>"Aretha Franklin"}, "genre_ids"=>["2"], "slug"=>"skylark"}
        
        #locate the song
        song = Song.find_by_slug(params[:slug])
        song.update(params[:song])
        #update the  artist 
        artist = Artist.find_or_create_by(name: params[:artist][:name]) 
        song.artist = artist
        #u just reassign like that. the old artist will no longer be associated

        #update genre
        song.genres.clear

        params[:genre_ids].each do | genreid |
            thegenre = Genre.find_by(id: genreid)
            song.genres << thegenre
        end

        #save
        
        song.save
        artist.save

        flash[:message] = "Successfully updated song."
        #binding.pry
        redirect "/songs/#{song.slug}"
    end


end
