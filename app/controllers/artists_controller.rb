class ArtistsController < ApplicationController
  get('/artists') {@artists=Artist.all; erb :'artists/index'}
  get('/artists/:slug') {@artist=Artist.find_by_slug(params[:slug]); erb :'artists/show'}
end
