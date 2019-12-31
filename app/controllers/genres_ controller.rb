class GenresController < ApplicationController

    get '/genres' do 
        @genres = Genre.all
        erb :'/views/genres/index'
        #get all artists as variable
        #each genre on display page clickable, shows genre page
    end

    get '/genres/:slug' do 
        #genre's show page has links to each of its songs & genres
    end


end
