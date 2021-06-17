class Song < ActiveRecord::Base
    belongs_to :artist

    has_many :song_genres
    has_many :genres, through: :song_genres

    include Slug
    after_validation :set_slug, only: [:create, :update]

end