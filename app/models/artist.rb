class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slug_split = slug.split("-")
    capitalize_slug = slug_split.map {|name| name.capitalize}
    found_artist = capitalize_slug.join(" ")
    Artist.find_by(name: found_artist)
  end

end
