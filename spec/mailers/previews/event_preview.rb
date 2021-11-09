# Preview all emails at http://localhost:3000/rails/mailers/event
class EventPreview < ActionMailer::Preview
  def new_event_email
    event = Event.new(title: "Friends-giving",
                      description: "We will celebrate Friends-giving in class 2 days before Thanksgiving.  Feel free to send your child to school with a feast.",
                      date: "11-23-2021",
                      time: "11am",
                      classroom_id: 1)

    EventMailer.with(event: event).new_event_email
  end
end
