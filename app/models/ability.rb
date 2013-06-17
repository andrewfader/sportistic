class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Team
    can [:edit, :update], Team do |team|
      team.captain_id == user.id
    end
  end
end
