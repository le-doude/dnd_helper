require 'commands/command'
require 'actions/system'

module Commands
  class Parser
    ACCEPTED_OPERATORS = ['=', ':', ':=']
    ASSIGNEMENTS_PATTERN = /\s*(#{ACCEPTED_OPERATORS.join('|')})\s*/
    BASIC_ASSIGNEMENT_OPERATOR = ':'

    def initialize
      _prepare_commands
      _compile_command_parser
    end

    def parse(command)
      string = _clean_assignements(command).downcase
      result = @regexp.match(string)
      if result
        command_name, param_string = result.captures
        mandatory, options = _parse_params(param_string)
        options = options.map { |k, v| [k.to_sym, v] }.to_h
        klass = @available_commands[command_name.downcase]
        if klass.is_a?(Class)
          instance = klass.instance if klass.respond_to?(:instance)
          instance ||= klass.new
          instance.call(*mandatory, **options)
        end
      else
        Actions::System::CouldNotParse.new(command)
      end
    end

    private

    def _prepare_commands
      @available_commands ||= ObjectSpace.each_object(Class).select { |klass| klass < Commands::Command }.map do |cc|
        [cc.name.split('::').last.downcase, cc]
      end.to_h
    end

    def _compile_command_parser
      @regexp ||= begin
        /^\s*(\w+)\s+([\w\s=:]+)$/
      end
    end

    def _clean_assignements(string)
      string.gsub(ASSIGNEMENTS_PATTERN, BASIC_ASSIGNEMENT_OPERATOR)
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
