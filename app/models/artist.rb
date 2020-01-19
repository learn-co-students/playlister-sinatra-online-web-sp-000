class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

    def slug
        self.name.ljust(100).strip.gsub(/[\s\t\r\n\f]/,'-').gsub(/\W/,'-').downcase
    end

    def self.find_by_slug(slug)
        self.find {|i| i.slug == slug}
    end


end
