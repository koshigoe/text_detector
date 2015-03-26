module TextDetector
  module Dictionary
    class Base
      def initialize(dictionary)
        setup(dictionary)
      end

      def lookup(member)
        raise NotImplementedError
      end

      def members
        raise NotImplementedError
      end

      protected

      def setup(dictionary)
        raise NotImplementedError
      end
    end
  end
end
