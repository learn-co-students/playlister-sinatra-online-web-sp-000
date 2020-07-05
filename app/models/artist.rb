require './app/models/concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
    include Slugify
    extend FindSlug
    has_many :songs
    has_many :genres, through: :songs
end