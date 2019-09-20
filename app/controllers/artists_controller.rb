class ArtistsController < ApplicationController

#This should present the user with a list of all artists in the library.
#Each artist should be a clickable link to that particular artist's show page.
  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

#Any given artist's show page should have links to each of his or her
#songs and genres.
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

end
