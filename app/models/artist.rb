require './modules/module'

class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs


  include InstanceMethod

  def self.find_by_slug(slug)

      @slug = slug
      format_beginning_of_slug
      results = self.where("name LIKE ?", @short_slug)
      results.detect do |result|
      result.slug === @slug
    end

  end

  def self.format_beginning_of_slug

      slug_beginning = @slug.split("-")[0]
      slug_beginning.prepend("%")
      slug_beginning << "%"
      @short_slug = slug_beginning

  end

end
