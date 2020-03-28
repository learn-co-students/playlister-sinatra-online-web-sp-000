class Song < ActiveRecord::Base
  belongs_to :artist #correct don't touch
  has_and_belongs_to_many :genres
end