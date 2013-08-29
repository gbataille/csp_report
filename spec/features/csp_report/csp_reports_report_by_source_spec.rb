require 'spec_helper'

describe 'CspReport report by source view' do
  before(:each) do
    @script_about   = FactoryGirl.create(:local_home_about_inline)
    @script_home    = FactoryGirl.create(:local_home_index_inline)
    @script_about_2 = FactoryGirl.create(:local_home_about_inline)
    @script_home_2  = FactoryGirl.create(:local_home_index_inline)
  end

  it 'should display a table of breaches per sources' do
    visit csp_reports_report_by_source_path
    page.should have_content('Source Document URI')
    page.should have_content('Number of breaches reported')
  end

  it 'should display each source only once' do
    visit csp_reports_report_by_source_path
    find('//table[@id="bysource"]').text.scan(@script_home.document_uri).size.should eq 1
    find('//table[@id="bysource"]').text.scan(@script_about.document_uri).size.should eq 1
  end

  it 'should have a link back to the violation page' do
    visit csp_reports_report_by_source_path
    page.should have_link 'Back to the violations view'
  end
end

