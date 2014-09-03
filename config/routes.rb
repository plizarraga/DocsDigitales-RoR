Rails.application.routes.draw do

  root :to => "welcome#index"

  get 'welcome/index'
  get 'sessions/new'

  resources :sessions
  get "log_in" => "sessions#new", :as => "log_in"
  get "sing_up" => "users#new", :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  resources :users
  post "findEmail" => "users#UserByEmail", :as => "findEmail"
  post "findRFC" => "users#UserByRFC", :as => "findRFC"
  post "findEmpresa" => "users#UserByEmpresa", :as => "findEmpresa"

  resources :stores
  get "sucursales" => "stores#index"
  get 'sucursal/:id', to: 'stores#show', :as => "sucursal"
  get "sucursal" => "stores#new", :as => "new_sucursal"
  get 'sucursal/:id/edit', to: 'stores#edit', :as => "edit_sucursal"

  resources :employees
  get "empleados" => "employees#index"
  get 'empleado/:id', to: 'employees#show', :as => "empleado"
  get 'empleado/:id/edit', to: 'employees#edit', :as => "edit_empleado"
  get "empleado", to: "employees#new", :as => "new_empleado"  
  post "findEmployeeNombre" => "employees#EmployeeByNombre", :as => "findEmployeeNombe"
  post "findEmployeeRFC" => "employees#EmployeeByRFC", :as => "findEmployeeRFC"

end