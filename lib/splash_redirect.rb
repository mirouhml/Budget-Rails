class SplashRedirect < Devise::FailureApp
  def route(scope)
    :users_url
  end
end