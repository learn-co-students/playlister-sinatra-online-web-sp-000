class Genre < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    has_many :songs
    has_many :artists, through: :songs
end