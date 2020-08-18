Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

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
  # contact
  get 'contacts/new'
  get 'contacts/create'
  # letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
