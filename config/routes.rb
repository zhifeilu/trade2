Trade2::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # get "home/index"
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    resources :products
    resources :posts
    root to: 'site#index'
    get '/contact' => 'site#contact', :as => "contact"
    get '/about' => 'site#about', :as => "about"
    get '*path', to: redirect("/#{I18n.default_locale}")
  end
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
  # get '*path' => redirect("/#{I18n.default_locale}/%{path}")
  # get '' => redirect("/#{I18n.default_locale}")

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
