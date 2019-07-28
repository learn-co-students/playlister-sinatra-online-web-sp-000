class Artist < ActiveRecord::Base
  extend Concerns::Slugable
  include Concerns::Slugable
  has_many :songs
  has_many :genres, through: :songs 

end

