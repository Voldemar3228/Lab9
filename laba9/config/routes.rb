Rails.application.routes.draw do
  get 'calc/input'

  get 'calc/view'

  root 'calc#input'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
