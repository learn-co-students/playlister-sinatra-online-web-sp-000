class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    require_relative "./concerns/slugifiable"

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end  