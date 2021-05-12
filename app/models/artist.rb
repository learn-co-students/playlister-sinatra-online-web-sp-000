class Artist < ActiveRecord::Base
    # has_secure_password
    has_many :songs
    has_many :genres, :through => :songs

    def slug
        self.name.gsub(" ","-").downcase
    end

    def self.find_by_slug(arg)
        name=arg.gsub("-", " ")
        Artist.find {|name| name.slug==arg}
        # binding.pry
        # self
    end
end