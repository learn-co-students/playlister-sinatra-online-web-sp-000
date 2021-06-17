class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    
    include Slug
    after_validation :set_slug, only: [:create, :update]
end