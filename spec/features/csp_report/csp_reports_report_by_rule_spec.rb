require 'spec_helper'

describe 'CspReport report by rule view' do
  before(:each) do
    @script_self   = FactoryGirl.create(:local_inline)
    @script_star = FactoryGirl.create(:local_script_star)
  end

  it 'should display a table of breaches per rule' do
    visit csp_reports_report_by_rule_path
    page.should have_content('Violated Directive')
    page.should have_content('Number of breaches reported')
  end

  it 'should display each rule only once' do
    visit csp_reports_report_by_rule_path
    find('//table[@id="byrule"]').text.scan(@script_self.violated_directive).size.should eq 1
    find('//table[@id="byrule"]').text.scan(@script_star.violated_directive).size.should eq 1
  end

end
