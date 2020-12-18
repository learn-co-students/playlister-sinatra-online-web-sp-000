class Slugifiable
    def self.call(text)
        text.gsub!(/[^0-9A-Za-z ]/, '').split(" ").join("-").downcase
    end
end