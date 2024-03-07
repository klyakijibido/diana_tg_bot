Rails.application.routes.draw do
  scope :callbacks, controller: :callbacks, format: false do
    post :telegram
  end
end
