class SongsController < ApplicationController

  get '/songs' do
    @songs=Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song=Song.create(params[:song])
    params[:genres].each do |g|
      @song.genres << Genre.find(g)
    end
      if !params[:artist][:name].empty?
        artist=Artist.find_by(:name => params[:artist][:name])
          if !artist
            artist=Artist.create(:name => params[:artist][:name])
          end
        @song.artist=artist
        @song.save
      else
        artist=Artist.find(params[:artist][:artist_id])
        @song.artist=artist
        @song.save
      end
    flash[:notice] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/new' do
    @artists=Artist.all
    @genres=Genre.all
    erb:'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres=Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    #if !params[:pet].keys.include?("owner_id")
    #  params[:pet]["owner_id"]=[]
    #end
    @song = Song.find_by_slug(params[:slug])
    artist=Artist.find_by(:name => params[:artist][:name])
    if !artist
      artist=Artist.create(:name => params[:artist][:name])
    end
    @song.artist=artist
    @song.save
    flash[:notice] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end
