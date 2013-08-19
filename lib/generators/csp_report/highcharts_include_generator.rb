module CspReport
  class HighchartsIncludeGenerator < Rails::Generators::Base
    desc "Add the necessary JS include for the gem charts to work"
    def setup_include
      inject_into_file "app/assets/javascripts/application.js",
        before: "//= require_tree ." do
<<-CONTENT
//= require csp_report
CONTENT
        end
    end
  end
end

