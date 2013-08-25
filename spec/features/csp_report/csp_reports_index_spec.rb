require 'spec_helper'

describe 'CspReport index view' do
  describe 'Report data headers' do
    before(:each) do
      visit csp_reports_path
    end

    it 'should display the report id' do
      page.should have_content 'ID'
    end
    it 'should display the report document URI' do
      page.should have_content 'Document URI'
    end
    it 'should display the report referrer' do
      page.should have_content 'Referrer'
    end
    it 'should display the report original policy' do
      page.should have_content 'Server Policy'
    end
    it 'should display the report violated directive' do
      page.should have_content 'Violated Directive'
    end
    it 'should display the report blocked URI' do
      page.should have_content 'Blocked URI'
    end
    it 'should display the report incoming IP' do
      page.should have_content 'Incoming IP'
    end
    it 'should display the report creation timestamp' do
      page.should have_content 'Reported At'
    end
    it 'should display an Actions column' do
      page.should have_content 'Actions'
    end
  end

  describe 'Report data content' do
    before(:each) do
      @local_inline = FactoryGirl.create(:local_inline)
      visit csp_reports_path
    end

    it 'should display the report id' do
      page.should have_content @local_inline.id
    end
    it 'should display the report document URI' do
      page.should have_content @local_inline.document_uri
    end
    it 'should display the report referrer' do
      page.should have_content @local_inline.referrer
    end
    it 'should display the report original policy' do
      page.should have_content @local_inline.original_policy
    end
    it 'should display the report violated directive' do
      page.should have_content @local_inline.violated_directive
    end
    it 'should display the report blocked URI' do
      page.should have_content @local_inline.blocked_uri
    end
    it 'should display the report incoming IP' do
      page.should have_content @local_inline.incoming_ip
    end
    it 'should display the report creation timestamp' do
      page.should have_content @local_inline.created_at
    end
    it 'should display a link to delete the report' do
      page.should have_link 'Delete violation',
        {href: csp_report_path(@local_inline.id)}
    end
  end

  describe 'Delete All functionnality' do
    it 'should make a "delete all" button available' do
      visit csp_reports_path
      page.should have_link "Delete All",
        {href: csp_reports_destroy_all_path}
    end
  end

  describe 'Links to data presentation' do
    it 'should have a link to the report by IP' do
      visit csp_reports_path
      page.should have_link 'By IP'
    end

    it 'should have a link to the report by Rule' do
      visit csp_reports_path
      page.should have_link 'By Violated Directive'
    end
  end
end
