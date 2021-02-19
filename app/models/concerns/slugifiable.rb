module Slugifiable
  attr_accessor :text

  module ClassMethods
    def self.slugify(text)
      remove_punctuation = text.gsub(/[!@#%^*()_'"`~].&-/, '')
      replace_dollar = remove_punctuation.gsub(/[$]/, 's')
      downcase_no_space = replace_dollar.downcase.gsub(/[" "]/, '-')      
    end   
  end
    
  module InstanceMethods
    def slug
      Slugifiable::ClassMethods::slugify(self.name)
    end   
  end
end