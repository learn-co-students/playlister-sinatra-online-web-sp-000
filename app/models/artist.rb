require_relative './concerns/slugfiable.rb' #add this so it can find module

class Artist < ActiveRecord::Base
  include Slugfiable::InstanceMethods
  extend Slugfiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end
