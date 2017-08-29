# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blacksmith/version"

Gem::Specification.new do |spec|
  spec.name          = "blacksmith"
  spec.version       = Blacksmith::VERSION
  spec.authors       = ["Adler Hsieh"]
  spec.email         = ["adler@hotmail.com"]

  spec.summary       = %q{A meme plugin for hipchat}
  spec.description   = %q{It posts image according to the pattern in the room}
  spec.homepage      = "https://github.com/adlerhsieh/blacksmith"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "host"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
