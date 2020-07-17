class ArtistsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

#displays all artists
#allows the view to access all of the artists in the databasae through instance variable Artist
  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

#find_by_slug method uses slug method to retrieve an artist from the database and return that entry
  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    erb :"artists/show"
  end
end
