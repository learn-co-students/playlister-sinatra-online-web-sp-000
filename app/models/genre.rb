class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slug_split = slug.split("-")
    capitalize_slug = slug_split.map {|name| name.capitalize}
    found_genre = capitalize_slug.join(" ")
    Genre.find_by(name: found_genre)
  end

end
