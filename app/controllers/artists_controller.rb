class ArtistsController < ApplicationController

    get '/artists' do 
        @artists = Artist.all
        erb :'/artists/index'
        #get all artists as variable
        #erb to index, each artist is clickable link to particular artist's show page
    end

    get '/artists/:slug' do 
        @artist = Artist.find_by_slug(params[:slug])
        erb :'artists/show'
        #artist's show page should have links to each of his or her songs & genres
    end

end
