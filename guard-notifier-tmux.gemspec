# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard-notifier-tmux/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Holden"]
  gem.email         = ["scott@carwoo.com"]
  gem.description   = %q{Displays guard notifications in tmux}
  gem.summary       = %q{Displays guard notifications in tmux}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-notifier-tmux"
  gem.require_paths = ["lib"]
  gem.version       = Guard::Notifier::Tmux::VERSION

	gem.add_runtime_dependency 'guard'
	gem.add_development_dependency 'rspec'
end
