class Slugifiable

  def self.slug (input_string)
    output_string = input_string.downcase.strip
    output_string = output_string.sub(' ','-')
  end


end
