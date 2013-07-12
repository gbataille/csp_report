module CspReport
  class CspDeclarationGenerator < Rails::Generators::Base
    desc "Adds the Content-Security-Policy directive in all the responses"
    def setup_filter
      inject_into_file "app/controllers/application_controller.rb",
        after: "ApplicationController < ActionController::Base\n" do
<<CONTENT

before_filter :csp

def csp
  response.headers['Content-Security-Policy'] = 
<<CSP
  default *;
  script-src 'self';
  report-uri '/csp/csp_reports'
CSP

end
CONTENT

        end
    end
  end
end

