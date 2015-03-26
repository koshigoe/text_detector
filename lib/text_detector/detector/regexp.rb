module TextDetector
  module Detector
    class Regexp < Base
      def detect(text)
        detected = @re.match(text)
        detected ? detected.to_s : nil
      end

      protected

      def setup
        @re = ::Regexp.union(dictionary.members)
      end
    end
  end
end
