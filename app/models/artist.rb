require_relative "concerns/slugifiable"

class Artist < ActiveRecord::Base
  
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  has_many :songs
  has_many :genres, through: :songs

end



  
  # def slug
  #   self.name.downcase.strip.gsub(' ', '-')
  # end
  
  # def self.find_by_slug(slug)
  #   self.all.detect {|e| e.name = slug.gsub('-',' ').split.collect {|e| e.capitalize}.join(" ")}
  # end
