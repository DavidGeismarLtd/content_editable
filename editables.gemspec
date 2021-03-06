
$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "editables/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "c-editables"
  spec.version     = Editables::VERSION
  spec.authors     = ["david geismar"]
  spec.email       = ["dageismar@gmail.com"]
  # spec.homepage    = "hello"
  spec.summary     = "Editables is an engine injecting basic cms functionnality into your app"
  spec.description = "Description of Editables."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  spec.add_development_dependency "pg"

  spec.add_development_dependency "rspec-rails"

  spec.add_development_dependency "factory_bot_rails"

  spec.add_development_dependency 'faker'

  spec.test_files = Dir["spec/**/*"]

end
