class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    #Initial error: Cannot have a has_many :through association 'Genre#artists' which goes through 'Genre#songs' before the through association is defined.
    #Means: Put the has_many: artists, through: :songs AFTER the song-genre and songs code

    def slug
        self.name.downcase.gsub(" ", "-")
        #Basically turning the whole thing lowercase and converting spaces to hyphens
    end 

    def self.find_by_slug(slug)
        #sodium = slug.gsub("-", " ").split
        #Split the slug into its component parts
        #chloride = []
        #Create empty array
        #sodium.each do |name|
         #   chloride << name.capitalize
        #end 
        #Capitalize each part of the array
        #salt = chloride.join(" ")
        #Join into a single string
        #Hahaha unslugging = salt, get it?
        #genre = Genre.find_by(name: "#{salt}")
        #Find by name we just created
        #genre
        #Don't forget to return the object
        
        Genre.all.find do |genre|
            genre.slug == slug
        end 
        #OR THIS IS SO MUCH SIMPLER
        #And then you don't run into problems where you have mismatched cases 
        #because you capitalized everything
    end 
end 