$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "asana_to_sig/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "asana_to_sig"
  s.version     = AsanaToSig::VERSION
  s.authors     = ["Grzegorz Kaczorek (GregPK)"]
  s.email       = ["grzegorz.kaczorek@gmail.com"]
  s.homepage    = "http://"
  s.summary     = "AsanaToSig is a bridge for adding Manado to a user based on their Asana activity"
  s.description = "Description of AsanaToSig."

  s.files = Dir["{lib}/**/*.rb", "bin/*" "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "thor"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end
