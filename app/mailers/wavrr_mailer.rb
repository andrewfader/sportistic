class WavrrMailer < Devise::Mailer
  def invitation_instructions(*args)
    @team = Team.find(User.find(args[0]).invited_to_id)
    super(*args)
  end
end
