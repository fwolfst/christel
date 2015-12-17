# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'christel/version'

Gem::Specification.new do |spec|
  spec.name          = "christel"
  spec.version       = Christel::VERSION
  spec.authors       = ["Felix Wolfsteller"]
  spec.email         = ["felix.wolfsteller@gmail.com"]

  spec.summary       = %q{Formalism for Crochet Patterns}
  spec.description   = %q{Christel provides the specification for crochet patterns and tool to render these.}
  spec.homepage      = ""
  spec.license       = "GPLv3"

  #spec.metadata['homepage ...']

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop"
  spec.add_dependency "ruby-graphviz"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
