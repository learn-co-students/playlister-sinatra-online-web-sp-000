class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    def slug
        @slug = name.gsub(" ","-").downcase
      end
    
    def self.find_by_slug(slug)
        self.all.find {|t| t.slug == slug}
    end

  end