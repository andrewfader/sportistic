class SportisticMailer < Devise::Mailer
  def invitation_instructions(*args)
    @team = Team.where(captain_id: User.find(args[0].invited_by_id).id).last
    super(*args)
  end
end
