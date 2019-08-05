class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethod
  include Slugifiable::InstanceMethod


  has_many :songs
  has_many :genres, through: :songs
end
