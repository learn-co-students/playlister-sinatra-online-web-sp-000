require './app/models/concerns/slugifiable.rb'

class Song<ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
belongs_to :artist
has_many :song_genres
has_many :genres, through: :song_genres

scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end