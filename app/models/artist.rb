class Artist < ActiveRecord::Baseß

    require_relative 'app/models/concerns'
    
    include Slugify::InstanceMethod
    extend Slugify::ClassMethod

    has_many :songs
    has_many :genres, through: :songs

end