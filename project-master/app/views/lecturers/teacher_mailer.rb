class TeacherMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.post_created.subject
  #
  def post_created
    @greeting = "Hi"

    mail to: User.all.pluck(:email), subject: "New Form Out On Black Board"
  end
end
