class SplashRedirect < Devise::FailureApp
  def route(_scope)
    :users_url
  end
end
