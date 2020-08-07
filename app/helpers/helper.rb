require 'sinatra/base'

module Helper 
    def slug
        @slug = self.name.gsub(/ /, '-').downcase
        @slug
    end
    
    module ClassMethods
        def self.find_by_slug(slug)
            deslug = slug.gsub(/-/, ' ').split
            deslug = deslug.map(&:capitalize)
            deslug = deslug.join(" ")
            name = self.find_by(name: deslug)
            name
        end
    end
end
