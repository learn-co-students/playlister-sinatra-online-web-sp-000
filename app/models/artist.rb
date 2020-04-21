require_relative './concerns/slugifiable'
class Artist < ActiveRecord::Base
    include Slugifiable::Slug 
    extend Slugifiable::FindBySlug
    has_many :songs 
    has_many :genres, through: :songs
end