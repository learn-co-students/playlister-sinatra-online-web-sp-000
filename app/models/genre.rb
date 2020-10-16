class Genre < ActiveRecord::Base

    require_relative './concerns/slugifiable.rb'
    
    include Slugifiable::InstanceMethod
    extend Slugifiable::ClassMethod
    
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

  

end