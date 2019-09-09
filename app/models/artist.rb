class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Findable
  include Slugable

  def self.find_or_create(name)
    slug=name.downcase.gsub(" ","-")
    if artist=self.find_by_slug(slug)
      artist
    else
      artist=Artist.create(:name=>name)
    end
  end
end
