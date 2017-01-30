require 'commands/command'
require 'actions/create_monster'

module Commands
  class Command
    class Create < Command
      def call(type, subtype, **params)
          return unless type
          case type.downcase.to_sym
          when :monster
            Actions::CreateMonster.new(subtype, **params)
          else
            :not_found
          end
      end
    end
  end
end
