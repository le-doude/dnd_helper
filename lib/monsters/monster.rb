module Monsters
  class Monster
    attr :archetype

    def initialize(archetype, options ={})
      @archetype = archetype
    end

    def apply(**actions)
      health += actions[:heal]
      experience += actions[:xp] || actions[:experience]
      spells -= actions[:use_spells]
      ammo -= actions[:use_ammo]

      actions[:damages].each do |damage|
        dp = damage_modification(damage)
        dp = damage_saves(damage.type, dp)
      end
    end

    private

    def damage_modification(points)
      return 0 if immune?(damage.type)
      if weak?(damage.type)
      elsif resistant?(damage.type)
        # TODO: check actual modifications
        damage.points / 2
      else
        damage.points
      end
    end
  end
end
