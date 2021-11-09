class ParentMailer < ApplicationMailer
  default from: 'notification.prekinder@gmail.com'

  def sign_up_email
    @parent = params[:parent]

    mail(to: @parent.email, subject: "Thanks for Signing Up!")
  end
end
