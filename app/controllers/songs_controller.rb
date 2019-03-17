
class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs=Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    end

    post '/songs' do
        @song = Song.create(:name => params[:song][:name])
        @artist=Artist.find_or_create_by(:name => params[:song][:artist])
        @song.artist_id=@artist.id
        @song.genre_ids = params[:song][:genre_id]
        @song.save
        flash[:message] = "Successfully created song."
        redirect "songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug]) 
        @song.update(params["song"])
        if !params["artist"]["name"].empty?
            @artist=Artist.find_or_create_by(:name => params[:artist][:name])
            @song.artist_id=@artist.id
        end
        if !params["genre"]["name"].empty?
            @song.genres << Genre.create(name: params["genre"]["name"])
          end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "songs/#{@song.slug}"
      end
end