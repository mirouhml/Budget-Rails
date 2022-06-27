class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User

    return unless user.present?

    can :manage, [Payment, Category], user_id: user.id
  end
end
