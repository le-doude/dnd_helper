module Monsters
  class Monster
    attr :archetype

    attr :health, :spells, :ammo, :conditions

    def initialize(archetype, options ={})
      @archetype = archetype
      @health = roll archetype.hit_dices
      call(**options)
    end

    def call(**actions)
      health += actions[:heal]
      health -= actions[:damage]
      experience += actions[:xp] || actions[:experience]
      spells -= actions[:use_spells]
      spells += actions[:add_spells]
      ammo -= actions[:use_ammo]
      ammo += actions[:add_ammo]
    end
  end
end
