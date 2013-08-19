$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "csp_report/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "csp_report"
  s.version     = CspReport::VERSION
  s.authors     = ["Gregory Bataille"]
  s.email       = ["gbataille.dev@gmail.com"]
  s.homepage    = "http://www.github.com/gbataille/csp_report"
  s.summary     = "Provide reporting and analysis of your site CSP violations"
  s.description = "Provide reporting and analysis of your site CSP violations"
  s.license     = "MIT"
  s.post_install_message = ""

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "haml", "~> 4.0.0"
  s.add_dependency "colorize", "~> 0.5.8"
  s.add_dependency "jquery-rails", "~> 3.0.4"
  s.add_dependency "lazy_high_charts", "~> 1.4.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.13.2"
  s.add_development_dependency "capybara", "~> 2.1.0"
  s.add_development_dependency "factory_girl_rails", "~> 4.2.1"
  s.add_development_dependency "sass-rails", "~> 4.0.0"
  s.add_development_dependency "haml-rails", "~> 0.4"
  s.add_development_dependency "genspec", "~> 0.2.8"
  s.add_development_dependency "guard", "~> 1.8.1"
  s.add_development_dependency "guard-spork", "~> 1.5.1"
  s.add_development_dependency "guard-rspec", "~> 3.0.2"
  s.add_development_dependency "terminal-notifier-guard", "~> 1.5.3"
end
