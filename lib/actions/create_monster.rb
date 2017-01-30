require 'actions/action'

module Actions
  class CreateMonster < Action
    attr :archetype, :options

    def initialize(archetype, options={})
      @archetype = archetype
      @options = options
    end

    def log
      "Created a #{archetype.to_s} with #{options}"
    end
  end
end
