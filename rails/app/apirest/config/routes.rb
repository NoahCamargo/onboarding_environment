Myapp::Application.routes.draw do
  resources :products, except: %i[new edit]
end
