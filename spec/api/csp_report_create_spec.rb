require 'spec_helper'

describe 'CspReport create API' do
  it 'should create a report' do
    report = {
      'document-uri' => "http://localhost:3000/home/index",
      'referrer' => "",
      'blocked-uri' => "",
      'violated-directive' => "script-src 'self'",
      'original-policy' => "script-src 'self'; report_uri /csp/csp_reports",
      'incoming-ip' => "127.0.0.1"
    }
    expect {
      post '/csp/csp_reports', 'csp-report' => report
    }.to change(CspReport::CspReport, :count).by(1)

    last_response.status.should eql(200)
  end
end
