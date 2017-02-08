# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'v1/version'

Gem::Specification.new do |spec|
  spec.name          = "api"
  spec.version       = V1::VERSION
  spec.authors       = ["Markus Peterson"]
  spec.email         = ["marcus17777@gmail.com"]

  spec.summary       = %q{API for our project in course "Web Application Development"}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/team-kektus/api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
