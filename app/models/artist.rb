require_relative 'slugable.rb'

class Artist < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMehthods

  has_many :songs
  has_many :genres, through: :songs
end