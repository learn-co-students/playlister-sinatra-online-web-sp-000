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
    song = Song.create(name: params[:song_name])

    if Artist.find_by_name(params[:artist_name])
      song.artist = Artist.find_by_name(params[:artist_name])
    else
      artist = Artist.create(name: params[:artist_name])
      song.artist = artist
    end

    Genre.all.each do |genre|
      if params[:genres].include?(genre.id.to_s)
        song.genres << genre
      end
    end

    song.save
    redirect "songs/#{song.slug}"
  end

end




#rspec ./spec/features/05_song_form_spec.rb:17     # Song Forms /songs/new without an existing artist creates a new artist on submit

#rspec ./spec/features/05_song_form_spec.rb:26     # Song Forms /songs/new without an existing artist creates a new song on submit

#rspec ./spec/features/05_song_form_spec.rb:38     # Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation

#rspec ./spec/features/05_song_form_spec.rb:61     # Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist

#rspec ./spec/features/05_song_form_spec.rb:73     # Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
