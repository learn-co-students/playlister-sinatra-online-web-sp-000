class Genre < ActiveRecord::Base
    has_many :artists
    has_many :songgenre
    has_many :songs, through: :songgenre

    def slug
        self.name.downcase.gsub(" ", "-")
        #Basically turning the whole thing lowercase and converting spaces to hyphens
    end 

    def self.find_by_slug(slug)
        sodium = slug.gsub("-", " ").split
        #Split the slug into its component parts
        chloride = []
        #Create empty array
        sodium.each do |name|
            chloride << name.capitalize
        end 
        #Capitalize each part of the array
        salt = chloride.join(" ")
        #Join into a single string
        #Hahaha unslugging = salt, get it?
        genre = Genre.find_by(name: "#{salt}")
        #Find by name we just created
        genre
        #Don't forget to return the object
    end 
end 