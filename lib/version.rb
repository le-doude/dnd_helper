module DndHelper
  VERSION = '0.1'.freeze

  def self.git_version
    `git describe  --tags --dirty`.chomp
  end
end
