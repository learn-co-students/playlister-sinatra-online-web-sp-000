class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    SongsGenre.all.find{|genre| genre.slug == slug}
  end
end
