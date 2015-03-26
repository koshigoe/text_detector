require_relative 'base'

module TextDetector
  module Detector
    class Regexp < Base
      def detect(text)
        matched = @re.match(TextDetector.normalize(text))
        if matched
          offset = matched.offset(0)
          text.slice(offset[0], offset[1] - offset[0])
        else
          nil
        end
      end

      def detect_all(text)
        TextDetector.normalize(text).to_enum(:scan, @re).map do
          offset = ::Regexp.last_match.offset(0)
          text.slice(offset[0], offset[1] - offset[0])
        end
      end

      protected

      def setup
        @re = ::Regexp.union(dictionary.members)
      end
    end
  end
end
