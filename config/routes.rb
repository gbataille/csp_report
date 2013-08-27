CspReport::Engine.routes.draw do
  # Careful, the destroy_all action needs to be defined BEFORE the resources
  # indeed the resources declaration add all the csp_reports/XXX routes to be 
  # the show XXX item action
  get '/csp_reports/destroy_all'
  get '/csp_reports/report_by_ip'
  get '/csp_reports/report_by_rule'
  get '/csp_reports/report_by_source'

  resources :csp_reports, except: [:create]
  resources :csp_reports, only: [:create], constraints: { format: /(json|xml)/ }
end
