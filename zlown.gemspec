# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/zlown/version'

Gem::Specification.new do |spec|
  spec.name = 'zlown'
  spec.version = Zlown::VERSION
  spec.authors = ['Tomas Korcak']
  spec.email = ['korczis@gmail.com']
  spec.summary = 'Evil Access Point'
  spec.description = 'Rogue Evil Access Point'
  spec.homepage = ''
  spec.license = 'MIT'
  spec.executables = ['zlown']

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'highline', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov', '~> 0.11'

  spec.add_dependency 'gli'
end

