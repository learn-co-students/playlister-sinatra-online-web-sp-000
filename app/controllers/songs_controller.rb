class SongsController < ApplicationController
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

end