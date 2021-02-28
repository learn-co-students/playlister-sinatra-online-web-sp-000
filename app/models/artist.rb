require_relative './concerns/slugifable.rb'

class Artist < ActiveRecord::Base
  extend Slugifable::ClassMethods
  include Slugifable::InstanceMethods
  has_many :songs
  has_many :genres, through: :songs
end
