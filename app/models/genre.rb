require './app/models/concerns/slugifiable.rb'

class Genre < ActiveRecord::Base
    include Slugify
    extend FindSlug
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
end