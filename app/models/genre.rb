require_relative "./concerns/slugifiable.rb"

class Genre < ActiveRecord::Base
    has_many :artists
    has_many :song_genres
    has_many :songs, through: :song_genres

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end