require 'spec_helper'
require 'genspec'
require 'fileutils'

# Can work if we simulate the app repo. need to find a way to have it use
# the dummy repo
module CspReport
  describe :"csp_report:initializer_install" do

    INITIALIZER_PATH = "config/initializers"
    INITIALIZER_FILE = INITIALIZER_PATH + "/csp_report.rb"

    def content_regexp(mount_point)
      /MOUNT_POINT\s*=\s*['|"]#{mount_point}['|"]/
    end

    within_source_root do
      FileUtils.mkdir_p INITIALIZER_PATH
    end

    context "with no argument" do
      it "should generate successfully" do
        subject.should generate
      end

      it "should put the right content in the initializer" do
        # csp is the default mount point
        subject.should generate {
          File.read(INITIALIZER_FILE).should =~ content_regexp('csp')
        }
      end
    end

    with_args :foo do
      it "should generate successfully" do
        subject.should generate
      end

      it "should put the right content in the initializer" do
        # csp is the default mount point
        subject.should generate do
          File.read(INITIALIZER_FILE).should =~ content_regexp('foo')
        end
      end
    end
  end
end

