class Song < ActiveRecord::Base
    # can belong to ONE artist
    belongs_to :artist
    # multiple genres
    has_and_belongs_to_many :genres
end