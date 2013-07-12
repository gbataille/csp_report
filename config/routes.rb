CspReport::Engine.routes.draw do
  # Careful, the destroy_all action needs to be defined BEFORE the resources
  # indeed the resources declaration add all the csp_reports/XXX routes to be 
  # the show XXX item action
  get '/csp_reports/destroy_all' #, controller: 'csp_reports#destroy_all'
  resources :csp_reports
end
