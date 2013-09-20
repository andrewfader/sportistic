class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.id
      can [:new, :create, :join, :destroy], Team
      can [:new, :create, :edit, :update, :join], Game do |game|
        game.team ? game.team.captain_id == user.id : true
      end
      can :approve, User
      can :create, Player
      can [:new, :index, :create, :destroy], UserSport
    end
    can [:edit, :update, :email, :send_email], Team do |team|
      team.captain_id == user.id
    end
    can [:edit, :update], User do |luser|
      luser.id == user.id
    end
    can [:read, :index], Game
    can [:read, :index], Team
    can [:read, :index], User
  end
end
