require 'commands/command'

module Commands
  def self.parse(string)
    @all_the_commands ||= ObjectSpace.each_object(Class).select { |klass| klass < Commands::Command }.map do |cc|
      [cc.name.split('::').last.downcase, cc]
    end.to_h
    @regexp ||= begin
      commands_regex = Regexp.new(@all_the_commands.keys.join('|'))
      /^\s*(#{commands_regex})\s+([\w\s]+)$/
    end
    _parse(string)
  end

  def self._parse(string)
    result = @regexp.match(string)
    if result
      cname, params = result.captures
      command_class = @all_the_commands[cname.downcase]
      puts cname
      puts params
      if command_class.is_a?(Class)
        command = command_class.new
        command.call(params)
      end
    end
  end
end
