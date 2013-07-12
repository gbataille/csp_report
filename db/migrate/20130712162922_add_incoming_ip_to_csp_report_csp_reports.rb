class AddIncomingIpToCspReportCspReports < ActiveRecord::Migration
  def change
    # Need to replace default by some kind of migration default only
    add_column :csp_report_csp_reports, :incoming_ip, :string, null: false,
      default: 'unknown'
  end
end
