Rails.application.routes.draw do
  get 'docs/new'
  get 'docs/create'
  get 'docs/update'
  get 'docs/edit'
  get 'docs/destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
