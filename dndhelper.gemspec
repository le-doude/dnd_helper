require File.expand_path('../lib/version', __FILE__)
require 'rubygems'
::Gem::Specification.new do |s|
  s.name                      = 'dndhelper'
  s.version                   = DndHelper::VERSION
  s.platform                  = ::Gem::Platform::RUBY
  s.authors                   = ['Edouard Pelosi']
  s.email                     = ['edouard.pelosi@gmail.com']
  s.homepage                  = 'http://github.com/le-doude/dnd_helper'
  s.summary                   = 'Stuff'
  s.description               = ''
  s.required_rubygems_version = '>= 1.3.6'
  s.files                     = Dir['lib/**/*.rb', 'bin/*', '*.md']
  s.require_paths             = ['lib']
  s.executables               = Dir['bin/*'].map { |f| f.split('/')[-1] }
  s.license                   = 'MIT'

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
