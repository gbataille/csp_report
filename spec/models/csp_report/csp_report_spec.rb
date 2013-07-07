require 'spec_helper'

describe CspReport::CspReport do
  before(:each) do
    @unsaved_report = {
      'document_uri' => "http://localhost:3000/home/index",
      'referrer' => "",
      'blocked_uri' => "",
      'violated_directive' => "script-src 'self'",
      'original_policy' => "script-src 'self'; report_uri /csp/csp_reports"
    }

    @unsaved_report_wout_document_uri = {
      'document_uri' => "",
      'referrer' => "",
      'blocked_uri' => "",
      'violated_directive' => "script-src 'self'",
      'original_policy' => "script-src 'self'; report_uri /csp/csp_reports"
    }

    @unsaved_report_wout_violated_directive = {
      'document_uri' => "http://localhost:3000/home/index",
      'referrer' => "",
      'blocked_uri' => "",
      'violated_directive' => "",
      'original_policy' => "script-src 'self'; report_uri /csp/csp_reports"
    }

    @unsaved_report_wout_original_policy = {
      'document_uri' => "http://localhost:3000/home/index",
      'referrer' => "",
      'blocked_uri' => "",
      'violated_directive' => "script-src 'self'",
      'original_policy' => ""
    }

  end

  describe "pure model" do
    it "should create a rew report when all the mandatory attributes are provided" do
      report = CspReport::CspReport.new(@unsaved_report)
      assert_not_nil report
    end

    it "should fail to create a report when the document_uri is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_document_uri)
      assert_nil report
    end

    it "should fail to create a report when the violated_directive is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_violated_directive)
      assert_nil report
    end

    it "should fail to create a report when the original_policy is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_original_policy)
      assert_nil report
    end
  end

  describe "active_record" do
    it "should save to the database when all the mandatory attributes are provided" do
      report = CspReport::CspReport.new(@unsaved_report)
      expect {
        report.save!
      }.to change(CspReport::CspReport, :count).by(1)
    end

    it "should fail to save to the db when the document_uri is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_document_uri)
      expect {
        report.save!
      }.to_not change(CspReport::CspReport, :count)
    end

    it "should fail to save to the db when the violated_directive is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_violated_directive)
      expect {
        report.save!
      }.to_not change(CspReport::CspReport, :count)
    end

    it "should fail to save to the db when the original_policy is missing" do
      report = CspReport::CspReport.new(@unsaved_report_wout_original_policy)
      expect {
        report.save!
      }.to_not change(CspReport::CspReport, :count)
    end
  end
end
