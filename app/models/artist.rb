require_relative './concerns/slugfiable'
class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs
  extend Slugfiable::ClassMethods
  include Slugfiable::InstanceMethods

end