Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#admin'
  get '/wellness' => 'application#wellness'
  post '/reply_to_user' => 'application#reply_to_user'
  
  namespace :api do
    namespace :v1 do
      patch '/mark_conversation_read/:uid' => 'messages#mark_conversation_read'
      post '/contact_us' => 'mailers#contact_us'
      get '/journals/:uid' => 'users#get_journals'
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
end