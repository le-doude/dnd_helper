module Commands
  class Command

    def call(string)
      fail NotImplementedError, "Need to implement #{self.class.name}::call method"
    end

  end
end

require 'commands/command/create'
