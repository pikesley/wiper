# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiper/version'

Gem::Specification.new do |spec|
  spec.name          = 'wiper'
  spec.version       = Wiper::VERSION
  spec.authors       = ['Sam Pikesley']
  spec.email         = ['sam.pikesley@gmail.com']

  spec.summary       = %q{Patterns for clearing the pHAT screen}
  spec.description   = %q{This is incredibly niche}
  spec.homepage      = 'https://github.com/pikesley/wiper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'pry', '~> 0.11'
end
