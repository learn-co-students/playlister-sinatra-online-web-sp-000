# rubyblog.pro/2017/04/class-methods-and-instance-methods-by-including-one-module

module Slugs

  module InstanceMethod
    def slug() self.name.downcase.gsub(" ","-") end
  end

  module ClassMethod
    def find_by_slug(slug) self.all.find { |item| item.slug == slug } end
  end

end
