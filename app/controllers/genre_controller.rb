class GenreController < ApplicationController
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  
  get '/genres' do
    @all_gen = Genre.all
    erb :genre_index
  end
  
  get '/genres/:slug' do
    @slug = params[:slug]
    @slug_genre = Genre.find_by_slug(@slug)
    erb :genre_slug
  end
  
end
