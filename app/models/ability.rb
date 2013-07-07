class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:new, :read, :index], Team
    if user.id
      can [:create, :join], Team
      can :approve, User
    end
    can [:edit, :update], Team do |team|
      team.captain_id == user.id
    end
    can [:read, :index], User
    can [:edit, :update], User do |luser|
      luser.id == user.id
    end
    can :create, Player
    can [:new, :read, :index, :create, :edit, :update], Game
    # can [:create, :edit, :update], Game do |game|
      # if game.team
        # game.team.member_users.include? user
      # end
    # end
  end
end
