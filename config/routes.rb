NewApp::Application.routes.draw do

  resources :responses

  devise_for :users

  root :to => 'static_pages#home'

  match '/help',         :to => 'static_pages#help'
  match '/about',        :to => 'static_pages#about'
  match '/contact',      :to => 'static_pages#contact'
  match '/options',      :to => 'static_pages#options'
  match '/experts',      :to => 'static_pages#experts'
  match '/start',        :to => 'static_pages#start'
  match '/resume',       :to => 'static_pages#resume'
  match '/view_report',  :to => 'static_pages#view_report'
  match '/references',   :to => 'static_pages#references'
  match '/test',         :to => 'static_pages#test' 
  match '/thankyou',     :to => 'static_pages#thankyou' 
  match '/returnsoon',   :to => 'static_pages#returnsoon' 
  
  
  namespace :admin do
    resources :users
    resources :sections do
      scope :module => 'sections' do
        resources :questions do
          scope :module => 'questions' do
            resources :responses
          end
        end
      end
    end
  end
  resources :admin

  namespace :user do
    resources :questionnaires do
      scope :module => 'questionnaires' do
        resources :answers
      end
    end
  end
  resources :user

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
