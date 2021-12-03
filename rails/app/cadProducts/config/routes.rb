CadProducts::Application.routes.draw do
  root 'registers#index'

  get 'product/:sku' => 'registers#show'

  post 'create' => 'registers#create'

  put 'update/:sku' => 'registers#update'

  delete 'destroy/:sku' => 'registers#destroy'

end
