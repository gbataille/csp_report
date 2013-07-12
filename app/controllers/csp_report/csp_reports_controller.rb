require_dependency "csp_report/application_controller"

class CspReport::CspReportsController < ApplicationController
  # The browser submitting the report will not have any CSRF token
  skip_before_filter :verify_authenticity_token

  def index
    @reports = CspReport::CspReport.all
  end

  def create
    param = request.request_parameters()['csp-report']
    report = CspReport::CspReport.new do |r|
      r.document_uri = param['document-uri']
      r.referrer = param['referrer']
      r.violated_directive = param['violated-directive']
      r.original_policy = param['original-policy']
      r.blocked_uri = param['blocked-uri']
    end
    report.save!
    render status: 200, nothing: true
  end

  def destroy
    CspReport::CspReport.destroy(params[:id])
    redirect_to csp_reports_path
  end
end
