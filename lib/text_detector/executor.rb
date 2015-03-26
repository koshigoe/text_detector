require_relative 'detector'
require_relative 'dictionary'

module TextDetector
  class Executor
    def initialize(type, dictionary)
      @detector = Detector.factory(type, Dictionary.factory(dictionary))
    end

    def detect(text)
      @detector.detect(TextDetector.shallow_normalize(text))
    end

    def detect_all(text)
      @detector.detect_all(TextDetector.shallow_normalize(text))
    end
  end
end
