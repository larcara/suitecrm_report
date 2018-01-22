Rails.application.routes.draw do
  resources :accounts do
   get :without_call_and_meetings, on: :collection
   get :google_map, on: :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
