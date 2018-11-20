class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    @genres = @song.genres
    erb :'/songs/show'
  end

  post '/songs/new' do
    song = Song.create(name: params[:name])
    if !Artist.all.include?(params[:artist_name])
      artist = Artist.create(name: params[:artist_name])
      song.artist = artist
      song.save
  
    end


  end

end




#rspec ./spec/features/05_song_form_spec.rb:17     # Song Forms /songs/new without an existing artist creates a new artist on submit

#rspec ./spec/features/05_song_form_spec.rb:26     # Song Forms /songs/new without an existing artist creates a new song on submit

#rspec ./spec/features/05_song_form_spec.rb:38     # Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation

#rspec ./spec/features/05_song_form_spec.rb:61     # Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist

#rspec ./spec/features/05_song_form_spec.rb:73     # Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
