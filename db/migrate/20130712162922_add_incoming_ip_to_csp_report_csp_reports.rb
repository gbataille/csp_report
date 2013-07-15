class AddIncomingIpToCspReportCspReports < ActiveRecord::Migration
  def change
    add_column :csp_report_csp_reports, :incoming_ip, :string, null: true

    CspReport::CspReport.all.each do |report|
      report.incoming_ip = 'Unknown (captured prior to v0.2.0)'
      report.save!
    end

    # Removes the default value
    change_column :csp_report_csp_reports, :incoming_ip, :string, null: false
  end
end
