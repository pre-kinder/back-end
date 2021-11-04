class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_bad_request(message)
    render json: { error: message }, status: :bad_request
  end
end
