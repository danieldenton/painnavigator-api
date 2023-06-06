Rails.application.routes.draw do
  devise_for :wellness_coaches, controllers: { sessions: 'wellness_coaches/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'wellness_coaches#wellness'

  get '/wellness'       => 'wellness_coaches#wellness'
  post '/reply_to_user' => 'wellness_coaches#reply_to_user'
  get 'download'        => 'application#download'
  
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
      resources :daily_pain_scores, only: [:index, :create]
    end
  end
end