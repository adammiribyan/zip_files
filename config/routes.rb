require 'sidekiq/web'

ZipFiles::Application.routes.draw do
  resources :delivery_files
  resources :source_work_files

  resources :projects do
    get '/zip_url/:type', to: "projects#zip_url", on: :member
  end

  mount Sidekiq::Web, at: '/sidekiq'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'projects#index'
end
