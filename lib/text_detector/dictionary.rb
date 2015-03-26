require_relative 'dictionary/file'

module TextDetector
  module Dictionary
    def self.factory(dictionary)
      case dictionary
      when ::File
        TextDetector::Dictionary::File.new(dictionary)
      end
    end
  end
end
