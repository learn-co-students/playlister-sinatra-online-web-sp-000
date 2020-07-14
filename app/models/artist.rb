class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    #puts "Slug is #{slug}."

    artist = Artist.all.select {|artist|
      artist.slug == slug

    }
    artist[0]
  end
end
