class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :'genres/show'
  end

end


 # <% @genres.each do |genre| %>
  #   <p>
  #    <input type="checkbox" id="genre_name" name="genres[]" value="<%= genre.name %>">
  #    <label for="genre_name"><%= genre.name %></label>
  #    </p>
  # <% end %>
