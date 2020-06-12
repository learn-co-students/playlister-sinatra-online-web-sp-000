class Artist < ActiveRecord::Base 
    #extend Slugifiable::ClassMethods
    #include Slugifiable::InstanceMethods

    has_many :songs 
    has_many :genres, through: :songs

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end 

    def self.find_by_slug(slug)
        
       Song.all.detect do |result|
         result.slug === @slug
       end
     end
    
end 