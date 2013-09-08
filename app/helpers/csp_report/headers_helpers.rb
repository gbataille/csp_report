module CspReport
  module HeadersHelper
    def add_navigation_header
  <<-CONTENT
  <div class='csp-report row'>
    <div class='csp-report navbar navbar-fixed-top'>
      <div class='csp-report navbar-inner'>
        <div class='csp-report container'>
          <a class='brand' href="#">CSP Reports</a>
          <ul class='nav'>
            <li class='active'>
              <a href=#{csp_reports_path}>Violations</a>
            </li>
            <li class='divider-vertical'/>
            <li>
              <a href=#{csp_reports_report_by_ip_path}>By IP</a>
            </li>
            <li>
              <a href=#{csp_reports_report_by_rule_path}>By Violated Directive</a>
            </li>
            <li>
              <a href=#{csp_reports_report_by_source_path}>By Source Document URI</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  CONTENT
    end
  end
end
