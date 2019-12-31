class ArtistsController < ApplicationController

    get '/artists' do 
        @artists = Artist.all
        erb :'/views/artists/index'
        #get all artists as variable
        #erb to index, each artist is clickable link to particular artist's show page
    end

    get '/artist/:slug' do 
        #artist's show page should have links to each of his or her songs & genres
    end

end
