require_relative 'detector/simple'
require_relative 'detector/regexp'

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
