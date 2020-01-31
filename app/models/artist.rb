require_relative './concerns/slugifiable.rb'
require_relative './concerns/findable.rb'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, :through => :songs

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    extend Findable::ClassMethods

end