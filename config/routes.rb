Rails.application.routes.draw do
  resources :tasks
 get "welcome/index"
 root to: "welcome#index"
end
