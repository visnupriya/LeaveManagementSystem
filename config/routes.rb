CompanyDetail::Application.routes.draw do
  

  resources :forms
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  #match 'emp/:id/invitation/new' => 'invitations#new'
   
  resources :invitations

 
   #match 'dept/:id/total_employees' => 'depts#total_employees'
   match  'emp/:id/invitation/new'=>'invitations#new'
   match  'emp/:id/invitation/show'=>'invitations#show'
   #match 'admin/new' => 'admin/sign_up/:invitation_token'
   get    'admins/sign_up/:emp_id/:invitation_token' => 'admins#new', :as => :signup
   
   match  'admins/forms/new'=>'forms#new' ,:as => :admins_forms_new,:controller=>"forms", :action=>"new"
   #get '/signup/:invitation_token', :controller => 'users', :action => 'new'
  
   resources  :depts  do
   resources :emps 
   end
    match 'dept/:dept_id/emp/new' => 'emps#new'
     
    # match 'dept/:id/emp/index' => 'emps#index'
     
     get "log_out" => "session1s#destroy", :as => "log_out"
     get "log_in" => "session1s#new", :as => "log_in"
     get "sign_up" => "admins#new", :as => "sign_up"
     #root :to => "users#new"
     resources :admins 
     resources :forms
     get 'forms/approval' => 'forms#approval' ,:as => :approval ,:controller=>"forms", :action=>"approval"
       
     resources :session1s
 

 
     
  resources :hrs

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
   root :to => 'depts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
