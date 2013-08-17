FactoryGirl.define do
  factory :local_inline, :class => 'CspReport::CspReport' do
    document_uri "http://localhost:3000"
    referrer ""
    blocked_uri ""
    violated_directive "script-src 'self'"
    original_policy "script-src 'self'; report-uri /csp/csp_reports"
    incoming_ip "127.0.0.1"
  end

  factory :local_home_index_inline, :class => 'CspReport::CspReport' do
    document_uri "http://localhost:3000/home/index"
    referrer ""
    blocked_uri ""
    violated_directive "script-src 'self'"
    original_policy "script-src 'self'; report-uri /csp/csp_reports"
    incoming_ip "127.0.0.1"
  end

  factory :local_ipv6_home_index_inline, :class => 'CspReport::CspReport' do
    document_uri "http://localhost:3000/home/index"
    referrer ""
    blocked_uri ""
    violated_directive "script-src 'self'"
    original_policy "script-src 'self'; report-uri /csp/csp_reports"
    incoming_ip "::1"
  end
end
