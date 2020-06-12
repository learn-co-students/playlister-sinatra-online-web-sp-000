class Genre < ActiveRecord::Base 
    #include Slugifiable::InstanceMethods

    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end 

    def self.find_by_slug(slug)
        
       Song.all.detect do |result|
         result.slug === @slug
       end
     end

end 