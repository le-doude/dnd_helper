require 'commands/command'

module Commands
  class Command
    class Create < Command

      PATTERN = /^(?<type>\w+)\s+(?<subtype>\w+)\s*(?<params>[\s\w]*)$/

      def call(string)
          type, subtype, params = parse_params
          return unless type
          case type.downcase.to_sym
          when :monster
            # Monster.archetype(subtype.downcase).create(params)
            :monster
          else
            :not_found
          end
      end

      private

      def parse_params(string)
        result = PATTERN.match(string)
        result.captures if result
      end

    end
  end
end
