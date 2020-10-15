class Artist < ActiveRecord::Base

    require_relative 'app/models/concerns'
    
    include Slugifiable::InstanceMethod
    extend Slugifiable::ClassMethod

    has_many :songs
    has_many :genres, through: :songs

end