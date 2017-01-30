require 'commands/command'

module Commands
  class Command
    class Create < Command
      def call(type, subtype, **params)
          return unless type
          case type.downcase.to_sym
          when :monster
            # Monster.archetype(subtype.downcase).create(params)
            :monster
          else
            :not_found
          end
      end
    end
  end
end
