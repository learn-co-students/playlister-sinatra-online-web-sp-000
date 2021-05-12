class Artist < ActiveRecord::Base
  include Gremlins::InstanceMethods
  extend Gremlins::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end
