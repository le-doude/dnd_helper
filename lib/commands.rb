require 'commands/parser'

module Commands
  def self.parser
    Parser.new
  end
end
