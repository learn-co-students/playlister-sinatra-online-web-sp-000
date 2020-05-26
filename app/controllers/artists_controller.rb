class ArtistsController < Sinatra::Base
  configure do
    set :views, 'app/views/artists'
  end

      get '/artists' do
        @artists = Artist.all
        erb :index
      end
      
      get '/artists/:slug' do
        @artist = Artist.find {|artist| artist.slug == "#{params[:slug]}"}
        erb :show
      end
end
