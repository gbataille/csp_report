Rails.application.routes.draw do

  get 'home/index'

  mount CspReport::Engine, at: 'csp'
end
