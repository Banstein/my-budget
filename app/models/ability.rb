class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    cannot :manage, Group, author: user

    return unless user.is? :admin

    can :manage, :all
  end
end
