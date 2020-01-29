class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethods

  def self.find_by_slug(slug)
    name = slug.split("-").each do |word|
      if word != "with" && word != "a"
        word.capitalize!
      end
    end
    Artist.find_by(name: name.join(" "))
  end
end
