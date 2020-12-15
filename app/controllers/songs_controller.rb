require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
    enable :sessions
    use Rack::Flash
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    

    get '/songs' do
      #present the user with a list of all songs in library
      #each song should be clickable link to that particular song's show page
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do
      #create a new song
      #genres should be presented as checkboxes
      #be able to enter the artist's name in a text field (only one artist per song)
      @genres = Genre.all
      erb :"songs/new"
  end
    
    get '/songs/:slug' do
        #any given song's show page should have links to that song's artist and each genre associated with the song
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :"songs/show"
    end



    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
    
        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
          if song.artist.name != artist_name
            song.artist = Artist.find_by(:name => artist_name)
          end
        else
          song.artist = Artist.create(:name => artist_name)
        end
    
        if song.genres
          song.genres.clear
        end
        genres = params[:song][:genres]
        genres.each do |genre|
          song.genres << Genre.find(genre)
        end
    
        song.save

        flash[:message] = "Successfully updated song."
        redirect to "songs/#{song.slug}"
    end

    get '/songs/:slug/edit' do
        #be able to change everything about a song, including the genres associated with it and its artist
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :"songs/edit"
    end
    post '/songs' do
        @song = Song.create(:name => params[:song][:name])

        artist_entry = params[:song][:artist]
        if Artist.find_by(:name => artist_entry)
            @artist = Artist.find_by(:name => artist_entry)
        else
            @artist = Artist.create(:name => artist_entry)
        end

        @song.artist = @artist
        
        @genres = []
        genre_selections = params[:song][:genres] #outputs genre id
        genre_selections.each do |genre|
            @genres << Genre.find(genre)
        end

        @song.genres = @genres

        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

  
  end