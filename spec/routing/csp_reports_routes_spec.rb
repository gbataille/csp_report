require 'spec_helper'

describe 'csp_report routing' do
  routes { CspReport::Engine.routes }
  # # Figure out where this method is coming from
  # assert_routing '/csp_report/csp_reports', controller: 'csp_reports', action: 'index'
  it 'should respond to index request' do
    get('/csp_reports').should route_to 'csp_report/csp_reports#index'
  end
  it 'should respond to create requests' do
    post('/csp_reports').should route_to 'csp_report/csp_reports#create'
  end
  it 'should respond to delete requests' do
    delete('/csp_reports/1').should route_to 'csp_report/csp_reports#destroy', id: '1'
  end
  it 'should respond to delete_all requests' do
    get('/csp_reports/destroy_all').should route_to 'csp_report/csp_reports#destroy_all'
  end
  it 'should respond to report_by_ip requests' do
    get('/csp_reports/report_by_ip').should route_to 'csp_report/csp_reports#report_by_ip'
  end
  it 'should respond to report_by_rule requests' do
    get('/csp_reports/report_by_rule').should route_to 'csp_report/csp_reports#report_by_rule'
  end
end
