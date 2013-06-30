require_dependency "csp_report/application_controller"

module CspReport
  class CspReportsController < ApplicationController
    # The browser submitting the report will not have any CSRF token
    skip_before_filter :verify_authenticity_token

    #Only provided as an API
    respond_to :json

    def index
      @reports = CspReport.all
    end

    def create
      param = request.request_parameters()['csp-report']
      report = CspReport.new do |r|
        r.document_uri = param['document-uri']
        r.referrer = param['referrer']
        r.violated_directive = param['violated-directive']
        r.original_policy = param['original-policy']
        r.blocked_uri = param['blocked-uri']
      end
      report.save!
      render status: 200, nothing: true
    end
  end
end