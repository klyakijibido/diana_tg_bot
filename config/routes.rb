Rails.application.routes.draw do
  root 'callbacks#index'

  scope :callbacks, controller: :callbacks, format: false do
    post :telegram
  end
end
