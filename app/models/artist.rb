class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  require_relative './concerns/slugifiable'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

end