Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :doubts
  resources :assignments
  resources :courses

  mount_devise_token_auth_for 'Person', at: 'auth', controllers: { sessions: "sessions", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'people/profile' => 'people#profile', :via => :get
  match 'teachers/courses' => 'teachers#courses', :via => :get
  match 'students/courses' => 'students#courses', :via => :get
  match 'students/courses/:course_id' => 'students#register_course', :via => :post
  match 'students/courses/:course_id' => 'students#unregister_course', :via => :delete
  match 'teachers/load_course' => 'teachers#load_course', :via => :get
  match 'courses/search' => 'courses#search', :via => :post
end
