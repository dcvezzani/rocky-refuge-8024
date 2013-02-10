Clf004::Application.routes.draw do
  get "welcome/index", as: :welcome
  get "welcome/wizard", as: :wizard_welcome
  get "welcome/wizard_bar", as: :wizard_bar_welcome

  get "welcome/portal_basic", controller: :portal
  get "portal/free_retirement_checkup", as: :free_retirement_checkup
  get "portal/select_a_financial_professional", as: :select_a_financial_professional
  get "portal/send_an_email", as: :send_an_email
  get "portal/register_for_my401k_plan_portal", as: :register_for_my401k_plan_portal
  get "portal/enter_my401k_plan_portal", as: :enter_my401k_plan_portal
  get "portal/enter_e_money_portal", as: :enter_e_money_portal
  get "portal/better_organize_your_financial_life", as: :better_organize_your_financial_life
  get "portal/log_in_for_existing_users", as: :log_in_for_existing_users
  get "portal/fast_start_support", as: :fast_start_support
  get "portal/log_in_to_access_e_money", as: :log_in_to_access_e_money
  get "portal/resource_center_content", as: :resource_center_content
  get "portal/general_advertisement", as: :general_advertisement
  get "portal/watch_plan_participant_portal_video", as: :watch_plan_participant_portal_video
  get "portal/view_triple_play_directory", as: :view_triple_play_directory

  get "portal/plan_participants" => "welcome#portal_basic", as: :portal_plan_participants

  

  devise_for :users

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
