module TextDetector
  module Detector
    class Base
      attr_reader :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
        setup
      end

      def detect(text)
        raise NotImplementedError
      end

      protected

      def setup
      end
    end
  end
end
