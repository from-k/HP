Rails.application.routes.draw do
  devise_for :users
  get 'contacts/new'
  get 'contacts/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"
  # static_pages
  get "/about", to: "static_pages#about"
  get "/activity", to: "static_pages#activity"
  get "/events", to: "static_pages#events"
  get "/contact", to: "contacts#new"
  post "/contact", to: "contacts#create"
  get "/event/1", to: "static_pages#event1"
  get "/event/2", to: "static_pages#event2"
  get "/event/3", to: "static_pages#event3"
  get "/event/4", to: "static_pages#event4"
end
