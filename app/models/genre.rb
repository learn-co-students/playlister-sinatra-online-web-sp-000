class Genre < ActiveRecord::Base
    has_many :song_genre
    has_many :songs, through: :song_genre

    has_many :artists, through: :songs

    include Slug
    after_validation :set_slug, only: [:create, :update]

end