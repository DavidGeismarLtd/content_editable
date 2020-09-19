
Editables::Engine.routes.draw do
  resources :fields, only: [:update]
end
