Rails.application.routes.draw do
  # devise_for :benutzers
  # #get 'welcome/index'
  #
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :users
    root 'welcome#index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
