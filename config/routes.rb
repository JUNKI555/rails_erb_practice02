Rails.application.routes.draw do
  ## 開発環境用letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :user, skip: :all
  devise_for :database_authentications, class_name: "User::DatabaseAuthentication", controllers: {
    sessions: 'user/database_authentication/sessions'
  }
  devise_for :registrations, class_name: "User::Registration", controllers: {
    confirmations: 'user/registrations'
  }
  devise_scope :registration do
    post "/registration/finish", to: "user/registrations#finish",  as: "finish_user_registration"
  end
  devise_for :users

  # Top
  get 'top/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
