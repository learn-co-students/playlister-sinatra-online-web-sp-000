require_relative './concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    has_many :songs
    has_many :genres, through: :songs
    def self.find_by_slug(b)
        self.all.find {|a| a.slug == b}
    end
end