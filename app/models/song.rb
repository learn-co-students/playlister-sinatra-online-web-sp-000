require './app/models/concerns/slugifiable.rb'

class Song < ActiveRecord::Base
    include Slugify
    extend FindSlug
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
end