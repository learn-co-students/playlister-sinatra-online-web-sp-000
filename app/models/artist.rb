require './app/models/concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
   extend Slugifiable::ClassMethods
   include Slugifiable::InstanceMethods
    has_many :songs
    has_many :genres, through: :songs
    
    scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end