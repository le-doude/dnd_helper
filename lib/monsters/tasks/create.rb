module Monsters
  module Tasks
    class Create < Task
      def call(name:, **options)
        archetype = Monsters.find_archetype(name)
        archetype.instanciate(options) if archetype
      end
    end
  end
end


