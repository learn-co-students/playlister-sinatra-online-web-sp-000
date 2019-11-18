class Artist < ActiveRecord::Base
has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(string)
    Artist.all.find { |artist| artist.slug == string}
  end
end