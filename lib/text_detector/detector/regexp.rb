require_relative 'base'

module TextDetector
  module Detector
    class Regexp < Base
      def detect(text)
        detected = @re.match(text)
        detected ? detected.to_s : nil
      end

      def detect_all(text)
        text.scan(@re)
      end

      protected

      def setup
        @re = ::Regexp.union(dictionary.members)
      end
    end
  end
end
