Rails.application.routes.draw do

  mount CspReport::Engine, at: 'csp'
end
