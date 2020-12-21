class Genre < ActiveRecord::Base
   has_many :songgenres
end