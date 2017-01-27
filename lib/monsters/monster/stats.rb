module Monsters
  class Monster
    Stats = Struct.new(:str, :dex, :con, :wis, :int, :cha) do
      def modifiers
        @modifiers ||= OpenStruct.new(self.map do |k, v|
          [k, modifier(v)]
        end)
      end

      private

      def modifier(i)
        (i.to_i - 10) / 2
      end
    end

  end
end
