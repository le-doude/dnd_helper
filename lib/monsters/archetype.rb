module Monsters
  class Archetype

    attr :name

    def initialize(name, options = {})
      @name = name
    end

    def instanciate(options= {})
      Monster.new(name, **options)
    end
  end
end
