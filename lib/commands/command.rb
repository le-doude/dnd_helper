module Commands
  class Command
    def call(string)
      fail NotImplementedError, "Need to implement #{self.class.name}::call method"
    end

    protected

    def history
      @history
    end

  end
end

Dir['./lib/commands/command/**/*.rb'].each do |name|
  require name.chomp.gsub(/\.rb$/, '')
end
