class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:new, :read], Team
    if user.id
      can [:create, :join], Team
      can :approve, User
    end
    can [:edit, :update], Team do |team|
      team.captain_id == user.id
    end
    can :read, User
    can [:edit, :update], User do |luser|
      luser.id == user.id
    end
    can :create, Player
  end
end
