require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index' 
    end
    
    get '/songs/new' do
        erb :'/songs/new' 
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show' 
    end

    post '/songs' do
        @song = Song.new
        @song.name = Song.titleize(params[:name])
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        params[:genre_ids].each {|genre_id|
            @song.genres << Genre.find(genre_id)
        }
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        
        if !params[:genre_ids]
            params[:genre_ids] = []
        end
    
        @song = Song.find_by_slug(params[:slug])
        @song.update(:name => Song.titleize(params[:name]))
        @song.update(:artist => Artist.find_or_create_by(name: params[:artist_name]))
        @song.genres = []
        params[:genre_ids].each {|genre_id|
            @song.genres << Genre.find(genre_id)
        }
        flash[:message] = "Successfully updated song."
        redirect "songs/#{@song.slug}"
    end
end