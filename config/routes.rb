Rails.application.routes.draw do

  root "recipes#index"
  resources "recipes" do
    member do
      post "like"
    end
  end

end
