class UserMailer < ActionMailer::Base
  default from: "welcome@playsportistic.com"
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

  def team_message(users, team, subject, message)
    @team = team
    @message = message
    mail(to: users.map(&:email), subject: subject.presence || "Message for #{team.name} from #{team.captain.name}")
  end
end
