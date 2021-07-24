# frozen_string_literal: true

require_relative "lib/sdcd/version"

Gem::Specification.new do |spec|
  spec.name          = "sdcd"
  spec.version       = Sdcd::VERSION
  spec.authors       = ["Madhava-mng"]
  spec.email         = ["alformint1@gmail.com"]

  spec.summary       = "Subdomain compresser"
  spec.description   = "Only for subdomains. it return back object"
  spec.homepage      = "https://github.com/Madhava-mng/sdcd-ruby"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygem.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.require_paths = ["lib"]
  spec.files = ["lib/sdcd.rb",
                "lib/sdcd/version.rb"
  ]
end
