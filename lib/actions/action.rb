module Actions
  class Action
    def confirmation?
    end
    def apply
    end
    def log
      fail NotImplementedError, 'any action needs logs'
    end
  end
end
