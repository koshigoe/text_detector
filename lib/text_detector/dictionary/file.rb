module TextDetector
  module Dictionary
    class File < Base
      attr_reader :depth

      def lookup(member)
        @dictionary.include? member
      end

      def members
        @dictionary.to_a
      end

      protected

      def setup(dictionary)
        @dictionary = Set.new
        @depth = []

        open(dictionary) do |input|
          input.each_line do |line|
            text = TextDetector.normalize(line.chomp)
            next if text.size == 0

            @dictionary << text
            @depth << text.size
          end
        end
        @depth = @depth.sort.uniq
      end
    end
  end
end
