# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blacksmith/version"

Gem::Specification.new do |spec|
  spec.name          = "blacksmith-hipchat"
  spec.version       = Blacksmith::VERSION
  spec.authors       = ["Adler Hsieh"]
  spec.email         = ["adler@hotmail.com"]

  spec.summary       = %q{A meme plugin for hipchat}
  spec.description   = %q{It posts image according to the pattern in the room}
  spec.homepage      = "https://github.com/adlerhsieh/blacksmith"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'robut', "0.5.2"
  spec.add_runtime_dependency 'hipchat', "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
