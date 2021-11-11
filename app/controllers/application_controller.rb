class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def render_bad_request(message)
    render json: { error: message }, status: :bad_request
  end

  def render_invalid_params(message)
      render json: { error: message }, status: :bad_request
  end

  def render_not_found(message)
    json_response({ error: message }, :not_found)
  end

  def render_unprocessable_entity(message)
    json_response({ error: message }, :unprocessable_entity)
  end

  def params_exist(param)
    param.present?
  end  
end
