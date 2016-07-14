class UserCallbacks
  def after_create(user)
    user.create_my_team
  end
end
