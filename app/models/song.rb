class Song < ActiveRecord::Base
    # can belong to ONE artist
    belongs_to :artist
    # multiple genres
    has_many :genres
end