Hackerboard::Application.routes.draw do
  root :to => "questions#index"

  namespace :admin do
    resources :categories do
      # member do
      #   get :remove
      # end

      get :remove, :on => :member
    end
  end

  controller :search do
    get "/search", :action => :questions, :as => :search
  end

  controller :sessions do
    get "/login", :action => :new
    post "/login", :action => :create
    get "/logout", :action => :destroy
  end

  controller :users do
    get "/signup", :action => :new
    post "/signup", :action => :create
    get "/users/:id", :action => :show, :as => :profile
  end

  controller :questions do
    get "/questions/feed", :action => :feed, :as => :questions_feed
    get "/questions/:id", :action => :show, :as => :question, :id => /\d+/
    get "/questions/new", :action => :new, :as => :new_question
    post "/questions/new", :action => :create, :as => false
    get "/questions", :action => :index, :as => :questions
  end

  post "/questions/:question_id/comments/new", :to => "comments#create", :as => :new_comment

  get "/dashboard", :to => "dashboard#index", :as => :dashboard
  get "/categories/:id", :to => "categories#show", :as => :category
end
