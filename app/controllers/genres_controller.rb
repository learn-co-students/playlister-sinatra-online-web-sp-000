class GenresController < ApplicationController
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    get '/genres' do
        @genres = Genre.all
        erb :'/genres/index'
    end

end