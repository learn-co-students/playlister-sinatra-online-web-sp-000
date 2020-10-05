class Song < ActiveRecord::Base
include Slugifiable
extend Findable

has_many :song_genres
has_many :genres, through: :song_genres
belongs_to :artist

end