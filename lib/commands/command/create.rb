require 'commands/command'

module Commands
  class Command
    class Create < Command
      def call(string)
        result = /^(?<type>\w+)\s+(?<subtype>\w+)\s*(?<params>[\s\w]*)$/.match(string)
        if result
          type, subtype, params = result.captures
          case type.downcase.to_sym
          when :monster
            # Monster.archetype(subtype.downcase).create(params)
            :monster
          else
            nil
          end
        end
      end
    end
  end
end
