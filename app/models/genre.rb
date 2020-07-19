require './app/models/concerns/slugifiable.rb'
class Genre < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs

scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end