class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    match = nil
    self.all.each do |a|
      if a.slug == slug
        match = a
      end
    end
    match
  end
end
