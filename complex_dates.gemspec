$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "complex_dates/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "complex_dates"
  s.version     = ComplexDates::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ComplexDates."
  s.description = "TODO: Description of ComplexDates."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  # s.add_dependency "jquery-rails"
end
