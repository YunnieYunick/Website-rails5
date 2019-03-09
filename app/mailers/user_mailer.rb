class UserMailer < ApplicationMailer
  default from: "from@example.com"
  default to: "to@example.com"

  def contact_form(user)
    @user = user
    mail(subject: 'SiteNameからお問い合わせがありました')
  end
end
