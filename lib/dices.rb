require 'dicebag'

module Dices

  class << self
    def parse(string)
      DiceBag::Roll.new(string)
    end
  end

end
