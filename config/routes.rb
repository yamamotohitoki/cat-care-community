Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :members, only: [:index, :show, :edit, :update] do
      get 'blog_index' => 'blogs#blog_index', as: 'blog_index'
    end

    resources :blogs, only: [:index, :show, :destroy] do
      resources :blog_comments, only: [:destroy]
    end

    resources :communities, only: [:index, :show, :destroy]
    resources :topics, only: [:index, :show, :destroy]
    resources :topic_comments, only: [:destroy]
  end

  # 会員用
  devise_for :member, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :member do
    post '/members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  scope module: :public do
    root to: 'homes#top'

    get "search" => "searches#search"

    get 'members/mypage' => 'members#edit', as: 'mypage'
    patch 'members/mypage' => 'members#update', as: 'update_mypage'
    get  '/members/check' => 'members#check', as: 'check_member'
    patch 'members/withdraw' => 'members#withdraw', as: 'withdraw_member'

    resources :members, only: [:show, :index] do
      # collection do
      #   get :mypage
      #   patch :mypage_update
      #   get :check
      #   patch :withdraw
      # end

      # get :blogs

      get :cats
      get :favorites
      get 'blog_index' => 'blogs#blog_index', as: 'blog_index'
    end

    resources :memos, only: [:create, :update, :destroy]

    resources :cats, only: [:show, :create, :edit, :update, :destroy]

    resources :blogs, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
      resources :blog_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy,]
    end

    resources :communities do
      resources :topics, only: [:show, :new, :create, :edit, :update, :destroy] do
       resources :topic_comments, only: [:create, :destroy]
    end
  end
  end
end
