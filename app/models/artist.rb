class Artist < ActiveRecord::Base

    has_many :songs
    has_many :genres, through: :songs
    
    def slug
        @slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        @slug
    end

    def self.find_by_slug(slug)
        Artist.all.find do |slug|
        slug.name
      end
    end
    
end

