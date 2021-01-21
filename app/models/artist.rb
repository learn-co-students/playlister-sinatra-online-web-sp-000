class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    require_relative "./concerns/slugifiable"

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
  