Rails.application.routes.draw do

  root :to => "welcome#index"

  get 'welcome/index'
  get 'sessions/new'
  
  resources :users
  post "findEmail" => "users#UserByEmail", :as => "findEmail"
  post "findRFC" => "users#UserByRFC", :as => "findRFC"
  post "findEmpresa" => "users#UserByEmpresa", :as => "findEmpresa"
 
  resources :sessions
  get "log_in" => "sessions#new", :as => "log_in"
  get "sing_up" => "users#new", :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :stores
  get "sucursales" => "stores#index"
end
