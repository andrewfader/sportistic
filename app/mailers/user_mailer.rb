class UserMailer < ActionMailer::Base
  def join_request(user, team)
    @user = user
    @team = team
    mail(to: team.captain.email, subject: "Request to join #{team.name}")
  end

  def approval_notice(user, team)
    @user = user
    @team = team
    mail(to: user.email, subject: "Request to join #{team.name}")
  end
end
