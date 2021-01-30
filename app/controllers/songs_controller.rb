require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new'
  end

  post '/songs' do
    song = Song.new(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist
    saved_value = song.save
    params[:genres].each do |genre|
      this_genre = Genre.find_by(name: genre)
      song.genres << this_genre
    end

    if !!saved_value
      flash[:message] = "Successfully created song."
      session[:session_message] = flash[:message]
      redirect "/songs/#{song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.genres = []

    # if params[:song].keys.include?("genres")
    #   params[:song]["genres"] = []
    # end

    # binding.pry
    @song.update(name: params[:song][:name])


    params[:song][:genres].each do |genre_id|
      this_genre = Genre.find(genre_id)
      @song.genres << this_genre
    end

    artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist = artist

    saved_value = @song.save

    if !!saved_value
      flash[:message] = "Successfully created song."
      session[:session_message] = flash[:message]
      redirect "/songs/#{song.slug}"
    end

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @success_message = session[:success_message]
    session[:success_message] = nil

    erb :'songs/show'
  end
end

# <% @pets.each do |pet| %>
#   <input type="checkbox" name="owner[pet_ids][]" id="<%= pet.id %>" value="<%= pet.id %>" <%='checked' if @owner.pets.include?(pet) %>><%= pet.name %></input><br>
# <% end %>

# # <% Genre.all.each do |genre| %>
# #   <p><input id="<%= genre.name %>" type="checkbox" name="genres[]" value=if checked "<%= @song.genres.name %>">
# #   <label><%= genre.name %></label></p>
# #   <% end %>

# <% @genres.each do |genre| %>
#   <input type="checkbox" name="song[genres][]" id="<%= genre.id %>" value="<%= genre.id %>" <%='checked' if @song.genres.include?(genre) %>><%= genre.name %></input><br>
# <% end %>
