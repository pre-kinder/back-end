class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)

    if @event.save
      EventMailer.with(event: @event).new_event_email.deliver
      json_response(EventSerializer.new(@event), :created)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end


  private

  def event_params
    params.permit(:title, :description, :date, :time, :classroom_id)
  end
end
