$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "execution_time/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "execution_time"
  spec.version     = ExecutionTime::VERSION
  spec.authors     = ["Igor Kasyanchuk"]
  spec.email       = ["igorkasyanchuk@gmail.com"]
  spec.homepage    = "https://github.com/igorkasyanchuk"
  spec.summary     = "Measure execution time in Rails console"
  spec.description = "Measure execution time in Rails console"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "irb"
  spec.add_development_dependency "pry"
end
