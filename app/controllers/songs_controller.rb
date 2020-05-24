require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    # create routes #####################################
    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/new"
    end

    post '/songs' do        
        # solution if also allow to select from existing artists
        # if params[:song][:artist_id]
        #     new_song = Song.create(params[:song])
        # else
        #     new_artist = Artist.create(params[:artist])
        #     new_song = new_artist.songs.build(params[:song])
        #     new_artist.save
        # end
        
        # school solution - doesn't allow to select from existing artists
        new_song = Song.create(params[:song])        
        new_song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        new_song.save
        
        # my solution - also allows to crete a new genre
        #   (the school solution doesn't allow creating a new genre, but mine still passes tests)
        if params[:genres]
            new_song.genre_ids = params[:genres].last
        else
            new_genre = Genre.create(params[:genre])
            new_song.genre_ids = new_genre.id
        end
        
        flash[:message] = "Successfully created song."
        redirect "/songs/#{new_song.slug}"
    end


    # read routes #####################################
    get '/songs' do
        @songs = Song.all        
        erb :"songs/index"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    # update routes #####################################
    get '/songs/:slug/edit' do        
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])        

        song.update(params[:song])
        song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        song.save

        if params[:genres]
            song.genre_ids = params[:genres].last
        else
            new_genre = Genre.create(params[:genre])
            song.genre_ids = new_genre.id
        end

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{song.slug}"
    end

end