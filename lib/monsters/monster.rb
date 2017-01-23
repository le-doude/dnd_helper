module Monsters
  class Monster
    attr :archetype

    def initialize(archetype, options ={})
      @archetype = archetype
    end

    def apply(**actions)
      health += actions[:heal]
      health -= actions[:damage]
      experience += actions[:xp] || actions[:experience]
      spells -= actions[:use_spells]
      ammo -= actions[:use_ammo]
    end
  end
end
