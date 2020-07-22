# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nsone/version"

Gem::Specification.new do |spec|
  spec.name          = "nsone"
  spec.version       = Nsone::VERSION
  spec.authors       = ["Nathan Anderson"]
  spec.email         = ["andnat@gmail.com"]
  spec.summary       = "A simple API client for NSOne"
  spec.description   = "A very simple API client for NSOne"
  spec.homepage      = "https://github.com/basecamp/nsone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.18.1"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 12"
end
