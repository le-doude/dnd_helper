require 'commands'
require 'commands/command'

module Commands
  class Parser

    def initialize
      _prepare_commands
      _compile_command_parser
    end

    def parse(string)
      _parse(string)
    end

    private

    def _prepare_commands
      @available_commands ||= ObjectSpace.each_object(Class).select { |klass| klass < Commands::Command }.map do |cc|
        [cc.name.split('::').last.downcase, cc]
      end.to_h
    end

    def _compile_command_parser
      @regexp ||= begin
        commands_regex = Regexp.new(@available_commands.keys.join('|'))
        /^\s*(#{commands_regex})\s+([\w\s]+)$/
      end
    end

    ACCEPTED_OPERATORS = ['=', ':', ':=']
    _ASSIGNEMENTS_PATTERN = /\s*(#{ACCEPTED_OPERATORS.join('|')})\s*]/
    BASIC_ASSIGNEMENT_OPERATOR = ':'

    def _clean_assignements(string)
      string.gsub(_ASSIGNEMENTS_PATTERN, BASIC_ASSIGNEMENT_OPERATOR)
    end

    def _parse(command)
      string = _clean_assignements(command).downcase
      result = @regexp.match(string)
      if result
        command_name, param_string = result.captures
        mandatory, options = _parse_params(param_string)
        @available_commands[command_name.downcase]).try do |klass|
          klass.new.call(*mandatory, **options)
        end
      end
    end

    def _parse_params(param_string)
      return [[], {}] unless param_string && !param_string.empty?
      bits = param_string.split(/\s+/)
      mandatory = bits.take_while { |s| (/#{BASIC_ASSIGNEMENT_OPERATOR}/ =~ s).nil? } || []
      options = bits[mandatory.size..-1].map do |s|
        h, *t = s.split(BASIC_ASSIGNEMENT_OPERATOR)
        [h, (t && !t.empty?) ? t.join('_') : true]
      end.to_h || {}
      [mandatory, options]
    end
  end
end
