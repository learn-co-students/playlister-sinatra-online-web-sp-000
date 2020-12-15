require 'pry'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

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
        #artist = Artist.find_by(name: )
        #Find by name we just created
        #artist
        #Don't forget to return the object

        Artist.all.find do |artist|
            artist.slug == slug
        end 
        #OR THIS IS SO MUCH SIMPLER
        #And then you don't run into problems where you have mismatched cases 
        #because you capitalized everything
    end 
end 