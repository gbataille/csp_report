module CspReport
  class CspDeclarationGenerator < Rails::Generators::Base
    desc "Adds the Content-Security-Policy directive in all the responses"
    def setup_filter
      inject_into_file "app/controllers/application_controller.rb",
        after: "ApplicationController < ActionController::Base\n" do
<<-CONTENT

  before_filter :csp

  def csp
    policy =  "default *;"
    policy << "script-src 'self';"
    policy << "report-uri /csp/csp_reports"
    response.headers['Content-Security-Policy'] = policy
  end

CONTENT
        end
    end
  end
end

