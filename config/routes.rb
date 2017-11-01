Rails.application.routes.draw do
    mount_devise_token_auth_for 'Person', at: 'auth', controllers: { sessions: "sessions", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    match 'people/profile' => 'people#profile', :via => :get
end
