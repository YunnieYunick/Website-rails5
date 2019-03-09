Rails.application.routes.draw do
  get 'contacts' => 'contacts#index', as: 'contacts_index'
  match 'contacts/confirm' ,:via => :post
  match 'contacts/create' ,:via => :post
  root 'pages#index'
  get 'about' => 'pages#about', as: 'pages_about'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
