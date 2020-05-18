$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "complex_dates/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "complex_dates"
  s.version     = ComplexDates::VERSION
  s.authors     = ["Andres Montano"]
  s.email       = ["amontano@virginia.edu"]
  s.homepage    = "http://subjects.kmaps.virginia.edu"
  s.summary     = "The Complex Dates plugin allows other models to be associated with Gregorian or Tibetan dates or date ranges. Complex Dates' helpers, views, and controllers are currently namespaced to admin, but this should be changed to allow for implementation in apps other than places_engine."
  s.description = "The Complex Dates plugin allows other models to be associated with Gregorian or Tibetan dates or date ranges. Complex Dates' helpers, views, and controllers are currently namespaced to admin, but this should be changed to allow for implementation in apps other than places_engine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 4.0'
  #s.add_dependency 'passiverecord', '0.2'
  s.add_development_dependency 'rspec-rails'
  # Use postgresql as the database for Active Record
  s.add_dependency 'pg'

  # s.add_dependency "jquery-rails"
end
