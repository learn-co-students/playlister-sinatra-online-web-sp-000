class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    include Concerns::Slug
    extend Concerns::Find_slug
end