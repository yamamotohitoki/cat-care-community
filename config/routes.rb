Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # 会員用
  # URL /customers/sign_in ...
  devise_for :member, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_scope :member do
    post "members/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: 'homes#top'

    get 'members/mypage' => 'members#edit', as: 'mypage'
    patch 'members/mypage' => 'members#update', as: 'update_mypage'
    get 'members/unsubscribe' => 'members#unsubscribe', as: 'confirm_unsubscribe'
    put 'members/information' => 'members#update'
    patch 'members/withdraw' => 'members#withdraw', as: 'withdraw_member'

    resources :members, only: [:show, :index]
    resources :cats, only: [:show, :index, :create, :edit, :update, :destroy]
    resources :blogs, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
      resources :blog_comments, only: [:create, :destroy]
    end
    resources :communities
    resources :topics, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :topic_comments, only: [:create, :destroy]
    end
  end
end