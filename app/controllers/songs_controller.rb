class SongsController < ApplicationController
   get '/songs' do
      @songs = Song.all

      erb :'/songs/index'
   end


   get '/songs/new' do
      erb :'/songs/new'
   end


   get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])

      erb :'songs/show'
   end


   get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])

      erb :'/songs/edit'
   end


   patch '/songs/:slug' do
      
      @song = Song.find_by_slug(params[:slug])
      @song.name = params[:song][:name]
      @song.artist.find_or_create_by(name: params[:artist][:name])
      @song.update(params[:song])
      @song.save

      @song.genres.clear

      params[:genres].each do |genre_id|
         @song.genres << Genre.find(genre_id.to_i)
      end

      flash[:message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
   end


   post '/songs' do
      @song = Song.create(name: params[:song][:name])
      @artist = Artist.find_by(name: params[:artist][:name])
      @genre = Genre.find(params[:genres].first.to_i)
      @song.genres << @genre
      if @artist != nil
         @song.artist = @artist
      else
         @artist = Artist.create(name: params[:artist][:name])
         @song.artist = @artist
      end
      @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
   end

end