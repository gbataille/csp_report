require 'spec_helper'

describe 'CspReport report by IP view' do
  before(:each) do
    @localhost4   = FactoryGirl.create(:local_inline)
    @localhost4_2 = FactoryGirl.create(:local_home_index_inline)
    @localhost6   = FactoryGirl.create(:local_ipv6_home_index_inline)
    @localhost6_2 = FactoryGirl.create(:local_ipv6_home_index_inline)
  end

  it 'should display a table of breaches per IP' do
    visit csp_reports_report_by_ip_path
    page.should have_content('Incoming IP')
    page.should have_content('Number of breaches reported')
  end

  it 'should display each IP only once' do
    visit csp_reports_report_by_ip_path
    find('//table[@id="byip"]').text.scan(@localhost4.incoming_ip).size.should eq 1
    find('//table[@id="byip"]').text.scan(@localhost6.incoming_ip).size.should eq 1
  end

end
