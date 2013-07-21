require 'spec_helper'
require 'genspec'
require 'fileutils'

# Can work if we simulate the app repo. need to find a way to have it use
# the dummy repo
module CspReport
  describe :"csp_report:mount" do

    def mount_string(mount_point)
      "\n  mount CspReport::Engine, at: '#{mount_point}'"
    end

    within_source_root do
      FileUtils.mkdir_p "config"
      FileUtils.touch "config/routes.rb"
    end

    context "with no argument" do
      it "should generate successfully" do
        subject.should generate
      end

      it "should mount the gem in the routes" do
        # This checks that you call the inject_into_file with exactly this content.
        # not very practical.
        # csp is the default mount point
        subject.should inject_into_file("config/routes.rb", 
                                        mount_string('csp'))
      end
    end

    with_args :foo do
      it "should generate successfully" do
        subject.should generate
      end

      it "should mount the gem in the routes" do
        subject.should inject_into_file("config/routes.rb", 
                                        mount_string('foo'))
      end
    end
  end
end

