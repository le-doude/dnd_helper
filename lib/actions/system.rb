module Actions
  module System
    class CouldNotParse < Action
      def initialize(string)
        @com = string
      end

      def log
        "Could not parse command: #{@com}"
      end
    end
  end
end
