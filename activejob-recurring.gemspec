# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "activejob/recurring/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activejob-recurring"
  s.version     = Activejob::Recurring::VERSION
  s.authors     = ["Cristian Bica"]
  s.email       = ["cristian.bica@gmail.com"]
  s.homepage    = "https://github.com/givlab/activejob-recurring"
  s.summary     = "Recurring jobs for ActiveJob"
  s.description = "Recurring jobs for ActiveJob powered by rufus-scheduler"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railties", ">= 5.2.0"
  s.add_dependency "activesupport", ">= 5.2.0"
  s.add_dependency "activejob", "=> 5.2.0"
  s.add_dependency "rufus-scheduler"
end
