class GenreController < ApplicationController
  # rake db:migrate SINATRA_ENV=test
  # rspec spec/features/04_basic_view_spec.rb --fail-fast
  
  get '/genres' do
    @all_gen = Genre.all
    erb :genre_index
  end
  
end
