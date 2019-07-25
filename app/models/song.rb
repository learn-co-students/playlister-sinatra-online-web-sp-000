class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-").delete ",", "'", '"', "@", "#"
  end

  def self.find_by_slug(name)
    self.all.find {|s| s.slug == name}
  end
end 
