class EventMailer < ApplicationMailer
  default to: -> { Parent.pluck(:email) },
          from: 'notification.prekinder@gmail.com'

  def new_event_email
    @event = params[:event]

    mail(subject: "Upcoming Event")
  end
end
