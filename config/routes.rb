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

  scope module: :public do
    root to: 'homes#top'

    get 'members/mypage' => 'members#edit', as: 'mypage'
    #get 'members/information/edit' => 'members#edit', as: 'edit_information'
    patch 'members/mypage' => 'members#update', as: 'update_mypage'
    get 'members/unsubscribe' => 'members#unsubscribe', as: 'confirm_unsubscribe'
    put 'members/information' => 'members#update'
    patch 'members/withdraw' => 'members#withdraw', as: 'withdraw_member'

    resources :cats, only: [:show, :index, :create, :edit, :update, :destroy]
    resources :blogs, only: [:show, :index, :create, :edit, :update, :destroy] do
      resources :blog_comments, only: [:create]
    end
    resources :communities do
      resources :topics, only: [:show, :create, :edit, :update, :destroy] do
        resources :topic_comments, only: [:create, :destroy]
      end
    end
  end
end