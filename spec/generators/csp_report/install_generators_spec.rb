require 'spec_helper'
require 'genspec'
require 'fileutils'

# Can work if we simulate the app repo. need to find a way to have it use
# the dummy repo
module CspReport
  describe :"csp_report:install" do
    # The below does not work. Genspec creates a new uniquely named substructure
    # anyway, and therefore needs to create folder and files
    # GenSpec.root=File.expand_path("../../../dummy", __FILE__)
    # within_source_root do
    #   FileUtils.mkdir_p "config"
    #   FileUtils.touch "config/routes.rb"
    #   FileUtils.touch "Rakefile"
    #   FileUtils.touch "Gemfile"
    #   File.open('Gemfile', 'w') do |f|
    #     f.write "gem 'csp_report', path: '~/Documents/Prog/csp_report'"
    #   end
    #   # Tried to run bundle install... did not work. not sure we have a rails
    #   # app in the temp location
    # end

    # context "with no arguments or options" do
    #   # This actually tries to run the generator in a /tmp folder.
    #   # thus the preparations above
    #   # Not very practical
    #   it "should generate successfully" do
    #     subject.should generate
    #   end

    #   it "should mount the gem in the routes" do
    #     # This checks that you call the inject_into_file with exactly this content.
    #     # not very practical.
    #     subject.should inject_into_file("config/routes.rb", 
    #                                     "\n  mount CspReport::Engine, at: 'csp'")
    #   end
    # end
  end
end
