
require_relative './concerns/slugify.rb'

class Song < ActiveRecord::Base
    
    #all instances of Artist have access to Slugifiable's methods (as instance methods)
    include Slugifiable 

    #Artist has Slugifiable's methods (as class methods)
    extend Slugifiable
  
    belongs_to :artist
    has_many :song_genres
    has_many :genres, :through => :song_genres

  end