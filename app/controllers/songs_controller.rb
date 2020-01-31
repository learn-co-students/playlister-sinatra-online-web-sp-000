require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all.sort_by { |song| song.name }
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        artist = Artist.find_or_create_by_name(name: params[:artist][:name])
        song = Song.find_or_create_by_name(name: params[:song][:name])
        if params[:genres]
            genres = []
            params[:genres].each do |name|
            genre = Genre.find_or_create_by_name(name: name)
            genres << genre unless genres.include?(genre)
          end
        end

        if params[:genre][:name] && params[:genre][:name] != ""
            genre = Genre.find_or_create_by_name(name: params[:genre][:name])
            genres ||= []
            genres << genre unless genres.include?(genre)
        end
        song.artist = artist
        song.genres = genres
        song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{song.slug}"
    end
    
    get '/songs/:slug/edit' do
        @song = Song.all.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = Genre.all
        erb :'songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.all.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres
        erb :'songs/show'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        artist = Artist.find_or_create_by_name(name: params[:artist][:name])
        if params[:genres]
            genres = []
            params[:genres].each do |name|
                genre = Genre.find_or_create_by_name(name: name)
                genres << genre unless genres.include?(genre)
            end
        end

        if params[:genre][:name] != ""
            genres ||= []
            genres << Genre.find_or_create_by_name(name: params[:genre][:name])
        end

        song.artist = artist
        song.genres = genres
        song.save
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{song.slug}"
    end    

end