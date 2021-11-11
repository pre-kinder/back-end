class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    json_response(EventSerializer.new(@events))
  end

  def show
    @event = Event.find(params[:id])
    json_response(EventSerializer.new(@event))
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      EventMailer.with(event: @event).new_event_email.deliver
      json_response(EventSerializer.new(@event), :created)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    @eventt.update!(event_params)
    json_response(EventSerializer.new(@event), :accepted)
  end

  def destroy
    @event.destroy
    head :no_content
  end


  private

  def event_params
    params.require(:classroom).permit(:title, :description, :date, :time, :classroom_id)
  end
end
