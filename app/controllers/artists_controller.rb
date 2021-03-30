class ArtistsController < Sinatra::Base

    get '/artists' do
        erb :artists/index
      end

end
