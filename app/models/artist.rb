
require_relative './concerns/slugify.rb'

class Artist < ActiveRecord::Base
    
    #all instances of Artist have access to Slugifiable's methods (as instance methods)
    include Slugifiable 

    #Artist has Slugifiable's methods (as class methods)
    extend Slugifiable
  
    has_many :songs
    has_many :genres, through: :songs
  
  end

