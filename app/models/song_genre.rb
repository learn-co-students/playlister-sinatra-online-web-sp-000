require_relative './concerns/slugifiable.rb'

class SongGenre < ActiveRecord::Base 
    belongs_to :song 
    belongs_to :genre

    include Slugifiable::InstanceMethod
    extend Slugifiable::ClassMethod
end