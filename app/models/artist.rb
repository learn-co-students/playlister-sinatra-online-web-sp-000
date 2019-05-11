class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.slug name
  end

  def self.find_by_slug (input_slug)
    all.find { |artist| artist.slug == input_slug }
  end
end
