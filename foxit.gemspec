# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foxit/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.9'
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'json', '~> 1.7'

  gem.name          = "foxit"
  gem.licenses = ['MIT']
  gem.version       = Foxit::VERSION
  gem.authors       = ["Steven Yang"]
  gem.email         = ["yangchenyun@gmail.com"]
  gem.description   = %q{ A ruby wrapper around GitLab V2 API }
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/yangchenyun/foxit"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
