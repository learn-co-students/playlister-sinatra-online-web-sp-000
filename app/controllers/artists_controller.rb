class ArtistsController < ApplicationController
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    get '/artists' do
        @artists = Artist.all
        erb :'/artists/index'
    end

end
