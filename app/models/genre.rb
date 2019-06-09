
require_relative './concerns/slugify.rb'

class Genre < ActiveRecord::Base
    
    #all instances of Artist have access to Slugifiable's methods (as instance methods)
    include Slugifiable 

    #Artist has access to Slugifiable's methods (as class methods)
    extend Slugifiable
  

    has_many :song_genres #needs to come first
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs


  
  end