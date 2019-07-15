Genre < ActiveRecord::Base 
include Slugifiable::InstanceMethods 

has_many :artists 
has_many :songs 
end 