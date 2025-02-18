Rails.application.routes.draw do
  devise_for :wellness_coaches, controllers: { sessions: 'wellness_coaches/sessions' }
  devise_for :provider_dashboards, controllers: { sessions: 'provider_dashboards/sessions'}
  delete 'provider_dashboards/sign_out', to: 'devise/sessions#destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'provider_dashboards#dashboard'

  get '/wellness'       => 'wellness_coaches#wellness'
  post '/reply_to_user' => 'wellness_coaches#reply_to_user'
  get 'download'        => 'application#download'
  post '/twillio_stop' => 'twillio_stop#handle'
  get '/provider_dashboard' => 'provider_dashboards#dashboard'
  get '/provider_dashboard_download' => 'provider_dashboards#download_pdf', defaults: { format: :pdf }
  get '/provider_list' => 'provider_dashboards#provider_list'
  get '/user_list' => 'provider_dashboards#user_list'
  get '/provider_users_dashboard' => 'provider_users_dashboard#user'
  
  namespace :api do
    namespace :v1 do
      patch '/mark_conversation_read/:uid' => 'messages#mark_conversation_read'
      post '/contact_us' => 'mailers#contact_us'
      get '/journals/:uid' => 'users#get_journals'
      get '/providers/:code' => 'providers#check_referral_code'
      get '/messages/:uid' => 'messages#get_conversation'
      resources :education_module_completions, only: [:index, :create, :update]
      resources :movement_module_completions, only: [:index, :create, :update]
      resources :food_journals, only: [:index, :create, :update]
      resources :messages, only: [:index, :create, :update]
      resources :mood_journals, only: [:index, :create, :update, :destroy]
      resources :pain_journals, only: [:index, :create, :update, :destroy]
      resources :pleasant_activities, only: [:index, :create, :update, :destroy]
      resources :smart_goals, only: [:index, :create, :update, :destroy]
      resources :smart_goal_updates, only: [:create, :update, :destroy]
      resources :users, only: [:show, :create, :update, :destroy]
    end
  end

  namespace :api do
    namespace :v2 do
      resources :education_module_completions, only: [:index, :create, :update]
      resources :users, only: [:show, :create, :update, :destroy]
      resources :daily_pain_scores, only: [:index, :create, :update]
      resources :smart_goals, only: [:index, :create, :update, :destroy]
      resources :pain_journals, only: [:index, :create, :update, :destroy]
      resources :mood_journals, only: [:index, :create, :update, :destroy]
      resources :food_journals, only: [:index, :create, :update]
      resources :movement_module_completions, only: [:index, :create, :update, :destroy]
    end
  end

  namespace :api do
    namespace :v3 do
      resources :onboard, only: [:index, :create, :update]
      resources :outcome, only: [:show, :create, :update]
    end
  end
end