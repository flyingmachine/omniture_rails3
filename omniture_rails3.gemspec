# Provide a simple s.add_development_dependencyspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "omniture_rails3"
  s.authors = ["Daniel Higginbotham"]
  s.email = %q{daniel@flyingmachinestudios.com}
  s.summary = "Insert OmnitureRails3 summary."
  s.description = "Insert OmnitureRails3 description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.textile"]
  s.version = "0.0.5"
  
  s.add_dependency "rails", "~> 3.0"
  s.add_dependency "higml", "0.0.2"

  s.add_development_dependency "capybara", ">= 0.4.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "ruby-debug"

end
