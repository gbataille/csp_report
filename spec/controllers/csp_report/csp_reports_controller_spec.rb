require 'spec_helper'

describe CspReport::CspReportsController do
  before(:each) do
    @local_inline = FactoryGirl.create(:local_inline)
    @local_home_index_inline = FactoryGirl.create(:local_home_index_inline)

    @reports = CspReport::CspReport.all
  end

  describe "destroy" do
    it "should delete the object" do
      expect {
        delete :destroy, id: @local_inline, use_route: 'csp'
      }.to change(CspReport::CspReport, :count).by(-1)

      assert_response(:redirect)
      assert_redirected_to(controller: 'csp_report/csp_reports', action: 'index')
      assert_nil CspReport::CspReport.find_by_id @local_inline.id
    end
  end

  describe "index" do
    it "should return all the reports in store" do
      get :index, use_route: 'csp'
      assert_response(:success)
      assert_not_nil assigns(:reports)
      assert_equal assigns(:reports).length, @reports.length
    end
  end

  describe "create" do
    before(:each) do
      @unsaved_report = {
        'document-uri' => "http://localhost:3000/home/index",
        'referrer' => "",
        'blocked-uri' => "",
        'violated-directive' => "script-src 'self'",
        'original-policy' => "script-src 'self'; report-uri /csp/csp_reports"
      }
    end

    it "should save the report in the db" do
      expect {
        post :create, 'csp-report' => @unsaved_report, :use_route => 'csp'
      }.to change(CspReport::CspReport, :count).by(1)

      report = CspReport::CspReport.last
      assert_equal @unsaved_report['document-uri'], report.document_uri
      assert_equal @unsaved_report['referrer'], report.referrer
      assert_equal @unsaved_report['blocked-uri'], report.blocked_uri
      assert_equal @unsaved_report['violated-directive'], report.violated_directive
      assert_equal @unsaved_report['original-policy'], report.original_policy
    end
  end

  describe "destroy all" do
    it "should delete all the reports in store" do
      delete :destroy_all, use_route: 'csp'

      assert_empty CspReport::CspReport.all
      assert_response :redirect
      assert_redirected_to(controller: 'csp_report/csp_reports', action: 'index')
    end
  end
end
