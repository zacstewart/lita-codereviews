# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/codereviews/version'

Gem::Specification.new do |spec|
  spec.name          = 'lita-codereviews'
  spec.version       = Lita::Codereviews::VERSION
  spec.authors       = ['Zac Stewart']
  spec.email         = ['zgstewart@gmail.com']
  spec.description   = %q{ A Lita handler for assigning weekly code reviews for a team }
  spec.summary       = %q{ A Lita handler for assigning weekly code reviews for a team }
  spec.homepage      = 'http://github.com/zacstewart/lita-codereviews'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
