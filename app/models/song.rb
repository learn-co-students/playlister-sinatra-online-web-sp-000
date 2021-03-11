class Song < ActiveRecord::Base

  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @song = self.all.find { |s| s.slug == slug }
  end

end