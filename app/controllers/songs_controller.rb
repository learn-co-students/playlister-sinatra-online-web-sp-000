require 'rack-flash'

class SongsController < Sinatra::Base 
    enable :sessions
    use Rack::Flash
    register Sinatra::ActiveRecordExtension
    set :session_secret, "app_secret_1020s035%djr43_%f4jiV~fe4(%FJ#fj5&(#f4j@$#0%r6w3"
    set :views, Proc.new {File.join(root, "../views")}

    get '/songs' do @songs = Song.all
        erb :'songs/index'
    end 

    get '/songs/new' do
        @genres = Genre.all
        erb :"songs/new"
    end 
    
    post '/songs' do 
        @song = Song.create(:name => params[:song][:name])
    
        artist_listing = params[:song][:artist]
        if Artist.find_by(:name => artist_listing)
            artist = Artist.find_by(:name => artist_listing)
        else 
            artist = Artist.create(:name =>artist_listing)
        end 
        @song.artist = artist

        genre_listing = params[:song][:genres]
        
        genre_listing.each do |genre|
            @song.genres << Genre.find(genre)
        end 
        @song.save 

        flash[:message] = "Successfully created song."
        redirect to "songs/#{@song.slug}"
    end 

    get '/songs/:slug' do 
        slug = params[:slug]
        @song = Song.find_by_slug(slug)
        erb :"songs/show"
    end 

    patch '/songs/:slug' do 
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]

        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
            if song.artist.name !=artist_name
                song.artist = Artist.find_by(:name=> artist_name)
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
            slug = params[:slug]
            @song = Song.find_by_slug(slug)
            erb :"songs/edit"
        end
    end 
