class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  public
  def slug
    words = self.name.split(" ")
    words = words.map { |word| word.downcase }
    words.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find { |artist| artist.slug == slug }
  end
end
