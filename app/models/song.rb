class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slug_split = slug.split("-")
    capitalize_slug = slug_split.map {|name| name.capitalize}
    found_song = capitalize_slug.join(" ")
    Song.find_by(name: found_song)
  end

end
