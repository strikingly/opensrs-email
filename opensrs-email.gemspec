# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opensrs/email/version'

Gem::Specification.new do |spec|
  spec.name          = "opensrs-email"
  spec.version       = Opensrs::Email::VERSION
  spec.authors       = ["Li Zhenchao"]
  spec.email         = ["zhenchao@strikingly.com"]
  spec.description   = %q{API to manage opensrs domain emails through APP (OpenSRS Email Service Account Provisioning Protocol)}
  spec.summary       = %q{API to manage opensrs domain emails through APP (OpenSRS Email Service Account Provisioning Protocol)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
