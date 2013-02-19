Clf004::Application.routes.draw do
  get "sticky_notes/index_by_referrer_url", as: :sticky_notes_by_referrer_url
  resources :sticky_notes

  get "welcome/index", as: :welcome
  get "welcome/wizard", as: :wizard_welcome
  get "welcome/wizard_bar", as: :wizard_bar_welcome
  get "portal/generate_mock_resource", as: :generate_mock_resource

  get "welcome/portal_basic"
  get "welcome/mock_portal_basic"
  get "welcome/portal_basic", controller: :portal, as: :asdf
  get "welcome/portal_basic", controller: :portal, as: :hotspot_placeholder
  get "portal/free_retirement_checkup", as: :free_retirement_checkup
  get "portal/select_a_financial_professional", as: :select_a_financial_professional
  get "portal/send_an_email", as: :send_an_email
  get "portal/send_an_email_to_employer", as: :send_an_email_to_employer

  get "portal/register_for_my401k_plan_portal", as: :register_for_my401k_plan_portal
  get "portal/enter_my401k_plan_portal", as: :enter_my401k_plan_portal
  get "portal/enter_e_money_portal", as: :enter_e_money_portal

  get "portal/better_organize_your_financial_life", as: :better_organize_your_financial_life
  get "portal/better_organize_your_financial_life_security", as: :better_organize_your_financial_life_security
  get "portal/better_organize_your_financial_life_test_drive", as: :better_organize_your_financial_life_test_drive
  get "portal/better_organize_your_financial_life_video", as: :better_organize_your_financial_life_video

  get "portal/log_in_for_existing_users", as: :log_in_for_existing_users
  get "portal/fast_start_support", as: :fast_start_support
  get "portal/log_in_to_access_e_money", as: :log_in_to_access_e_money
  get "portal/resource_center_content", as: :resource_center_content
  get "portal/resource_center_welcome", as: :resource_center_welcome
  get "portal/resource_center_all", as: :resource_center_all
  get "portal/resource_center_item", as: :resource_center_item

  get "portal/general_advertisement", as: :general_advertisement
  get "portal/watch_plan_participant_portal_video", as: :watch_plan_participant_portal_video
  get "portal/view_triple_play_directory", as: :view_triple_play_directory

  get "portal/plan_participants" => "welcome#portal_basic", as: :portal_plan_participants

  get "portal/become_a_premium_member", as: :become_a_premium_member
  get "portal/resource_center_welcome", as: :resource_center_welcome
  get "portal/personal_portal_welcome", as: :personal_portal_welcome
  get "portal/register_for_premium_membership", as: :register_for_premium_membership
  get "portal/read_terms_and_conditions_for_premium_membership", as: :read_terms_and_conditions_for_premium_membership
  get "portal/read_terms_and_conditions_for_my401k_portal", as: :read_terms_and_conditions_for_my401k_portal
  get "portal/read_terms_and_conditions_for_free_retirement_checkup", as: :read_terms_and_conditions_for_free_retirement_checkup

  get "portal/see_more_info_for_financial_professional", as: :see_more_info_for_financial_professional
  get "portal/view_adv_for_financial_professional", as: :view_adv_for_financial_professional
  get "portal/view_reviews_for_financial_professional", as: :view_reviews_for_financial_professional

  get "portal/my_retirement_plan_sponsor_portal", as: :my_retirement_plan_sponsor_portal
  get "portal/lets_go_retirement_readiness_epidemic", as: :lets_go_retirement_readiness_epidemic
  get "portal/watch_retirement_readiness_epidemic_video", as: :watch_retirement_readiness_epidemic_video
  get "portal/my_401k_log_in", as: :my_401k_log_in
  get "portal/my_401k_register", as: :my_401k_register
  get "portal/my_401k_help", as: :my_401k_help
  get "portal/lets_go_fiduciary_market", as: :lets_go_fiduciary_market
  get "portal/fiduciary_market_providers", as: :fiduciary_market_providers
  get "portal/zero_cost_service_download_pdf", as: :zero_cost_service_download_pdf
  get "portal/concierge_plan_sponsor", as: :concierge_plan_sponsor
  get "portal/advertisement_plan_sponsor", as: :advertisement_plan_sponsor
  get "portal/enter_my401k_plan_portal_plan_sponsor", as: :enter_my401k_plan_portal_plan_sponsor
  get "portal/register_for_my401k_plan_portal_plan_sponsor", as: :register_for_my401k_plan_portal_plan_sponsor
 
  get "portal/my_retirement_plan_service_provider_portal", as: :my_retirement_plan_service_provider_portal
  get "portal/lets_go_improve_visibility", as: :lets_go_improve_visibility
  get "portal/watch_improve_visibility_video", as: :watch_improve_visibility_video
  get "portal/fiduciary_market_log_in", as: :fiduciary_market_log_in
  get "portal/fiduciary_market_register", as: :fiduciary_market_register
  get "portal/fiduciary_market_help", as: :fiduciary_market_help
  get "portal/pricing_list_ads_download_pdf", as: :pricing_list_ads_download_pdf
  get "portal/free_advertising", as: :free_advertising
 
  get "portal/log_in_fiduciary_market_plan_service_provider", as: :log_in_fiduciary_market_plan_service_provider
  get "portal/enter_fiduciary_market", as: :enter_fiduciary_market
  
  get "portal/my401k_help", as: :my401k_help

  get "portal/order_your_free_retirement_checkup", as: :order_your_free_retirement_checkup
  get "portal/schedule_your_initial_interview", as: :schedule_your_initial_interview
  get "portal/request_initial_interview", as: :request_initial_interview
  get "portal/terms_and_conditions", as: :terms_and_conditions
  
  get "portal/log_in_or_register_popup", as: :log_in_or_register_popup
  get "portal/log_in_as_existing_user", as: :log_in_as_existing_user
  get "portal/register_as_a_new_user", as: :register_as_a_new_user
 
  get "portal/mrrme_membership_options", as: :mrrme_membership_options
  get "portal/mrrme_terms_and_conditions", as: :mrrme_terms_and_conditions
  get "portal/mrrme_register_now", as: :mrrme_register_now
  
  post "portal/sticky_note"

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
