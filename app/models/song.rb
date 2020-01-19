class Song < ActiveRecord::Base
belongs_to :artist
has_many :song_genres
has_many :genres, through: :song_genres

def slug
    self.name.ljust(100).strip.gsub(/[\s\t\r\n\f]/,'-').gsub(/\W/,'-').downcase
end

def self.find_by_slug(slug)
    self.find {|i| i.slug == slug}
end

end
