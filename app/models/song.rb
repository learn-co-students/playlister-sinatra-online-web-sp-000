class Artist < ActiveRecord::Base
  has_one :artist  
  has_many :genres 
end