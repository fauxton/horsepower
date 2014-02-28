# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horsepower/version'

Gem::Specification.new do |spec|
  spec.name          = "horsepower"
  spec.version       = Horsepower::VERSION
  spec.authors       = ["Curtis Ekstrom"]
  spec.email         = ["ce@canvus.io"]
  spec.description   = %q{RSpec and Cucumber-fueled mountable Rails Engine generator}
  spec.summary       = %q{Generate mountable rails engines with popular BDD/TDD tools}
  spec.homepage      = "https://www.github.com/fauxton/horsepower"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
