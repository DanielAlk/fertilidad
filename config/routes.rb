Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'admin' => 'admins#index'
  get 'admin/list' => 'admins#list'
  match 'admin' => 'admins#destroy', via: :delete
  devise_for :admins, controllers: { 
    registrations: 'admins/registrations', 
    sessions: 'admins/sessions', 
    passwords: 'admins/passwords'
  }

  get 'imagenes/item/:id' => 'image_galleries#show_item', as: :image_gallery_item
  match 'imagenes/item/:id' => 'image_galleries#destroy_item', via: :delete
  resources :image_galleries, path: 'imagenes' do
    get 'preview_items', path: 'preview', as: :preview
    put 'update_items', path: 'items', as: :items
  end
  
  get 'institucional' => 'static_pages#institutional', as: :institutional
  get 'images' => 'static_pages#images', as: :static_images
  get 'instructivos' => 'static_pages#instructional', as: :instructional
  get 'espermograma' => 'static_pages#spermogram', as: :spermogram
  get 'inseminacion' => 'static_pages#insemination', as: :insemination
  get 'contacto' => 'static_pages#contact', as: :contact
  get 'descargas' => 'static_pages#downloads', as: :downloads

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
