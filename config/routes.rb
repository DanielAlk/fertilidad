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
  resources :downloads, path: 'descargas'
  resources :instructionals, path: 'instructivos'
  resources :schedules, path: 'horarios'
  resources :contacts, path: 'contactos'
  resources :articles
  resources :team_members
  resources :practice_types do
    resources :practices, shallow: true
  end
  
  get 'institucional' => 'static_pages#institutional', as: :institutional
  get 'informacion' => 'static_pages#information', as: :information
  get 'servicios' => 'static_pages#services', as: :services
  get 'noticias' => 'static_pages#news', as: :news
  post 'noticias/:page' => 'static_pages#news_page', as: :news_page
  get 'contacto' => 'static_pages#contact', as: :contact_page

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
