module TextDetector
  module Detector
    def self.factory(type, dictionary)
      case type
      when :simple
        TextDetector::Detector::Simple.new(dictionary)
      when :regexp
        TextDetector::Detector::Regexp.new(dictionary)
      else
        raise NameError
      end
    end
  end
end
