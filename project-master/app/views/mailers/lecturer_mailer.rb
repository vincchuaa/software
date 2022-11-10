class LecturerMailer < ApplicationMailer
  default to: -> { Lecturer.pluck(:email) },
          from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    mail(subject: "New User Signup: #{@user.email}")
  end
end