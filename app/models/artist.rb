class Artist < ActiveRecord::Base
    # can have multiple songs
    has_many :songs
    # can have multiple genres
end