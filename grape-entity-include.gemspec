require_relative 'lib/grape_entity_include/version'
Gem::Specification.new do |spec|
  spec.name          = "grape-entity-include"
  spec.version       = GrapeEntityInclude::VERSION
  spec.authors       = ["Dzung Nguyen"]
  spec.email         = ["ntd63t@gmail.com"]

  spec.summary       = %q{An include option for grape-entity, expose object model's attributes if matching with attr_path option}
  spec.description   = %q{An include option for grape-entity, expose object model's attributes if matching with attr_path option}
  spec.homepage      = "https://github.com/ntd63t/grape-entity-include.git"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grape-entity", ">= 0.5.0"
  spec.add_dependency "activesupport"
end
