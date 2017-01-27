require 'monsters/monster/stats'

module Monsters
  class Archetype
    Stats =  Struct.new(:str, :dex, :con, :wis, :int, :cha) do

      def instanciate(str: 0, dex: 0, con: 0, wis: 0, int: 0, cha: 0)
        Monsters::Monster::Stats.new(
          self.str + str,
          self.dex + dex,
          self.con + con,
          self.wis + wis,
          self.int + int,
          self.cha + cha
        )
      end

    end
  end
end
