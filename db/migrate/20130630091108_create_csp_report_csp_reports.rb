class CreateCspReportCspReports < ActiveRecord::Migration
  def change
    create_table :csp_report_csp_reports do |t|
      t.string :document_uri       , null: false
      t.string :referrer
      t.string :blocked_uri
      t.string :violated_directive , null: false
      t.string :original_policy    , null: false

      t.timestamps
    end
  end
end
