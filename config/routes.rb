Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"
  # static_pages
  get "/about", to: "static_pages#about"
  get "/activity", to: "static_pages#activity"
  get "/event", to: "static_pages#event"
end
