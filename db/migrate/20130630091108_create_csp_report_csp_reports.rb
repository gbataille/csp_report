class CreateCspReportCspReports < ActiveRecord::Migration
  def change
    create_table :csp_report_csp_reports do |t|
      t.string :document_uri
      t.string :referrer
      t.string :blocked_uri
      t.string :violated_directive
      t.string :original_policy

      t.timestamps
    end
  end
end
