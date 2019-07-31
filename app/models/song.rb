class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @song = nil
    self.all.each do |song|
      if song.slug == slug
        @song = song
      end
    end
    @song
  end
  
end