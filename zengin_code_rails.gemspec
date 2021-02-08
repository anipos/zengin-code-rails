# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "zengin_code_rails"
  spec.version       = "0.4.1"
  spec.authors       = ["Shouichi Kamiya"]
  spec.email         = ["shouichi.kamiya@gmail.com"]

  spec.summary       = "Provides rails integration of zengin_code gem."
  spec.description   = "Provides rails integration (such as API) of zengin_code gem."
  spec.homepage      = "https://github.com/anipos/zengin-code-rails"
  spec.license       = "Apache-2.0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir["README.md", "LICENSE", "{app,config,lib}/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "jbuilder"
  spec.add_dependency "rails", "~> 6.0"
  spec.add_dependency "zengin_code"
end
