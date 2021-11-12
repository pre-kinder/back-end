class Api::V1::ParentsController < ApplicationController
  # before_action :find_parent, only: [:show, :update, :destroy]

  def index
    parents = Parent.all
    json_response(ParentSerializer.new(parents))
  end

  def show
    @parent = Parent.find(params[:id])
    json_response(ParentSerializer.new(@parent))
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      ParentMailer.with(parent: @parent).sign_up_email.deliver
      json_response(ParentSerializer.new(@parent), :created)
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  def update
    @parent = Parent.find(params[:id])
    @parent.update!(parent_params)
    json_response(ParentSerializer.new(@parent), :accepted)
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    head :no_content
  end

  def find
    if params_exist(params[:email])
      parent = Parent.search_email(params[:email])
      render json: (parent ? ParentSerializer.new(parent) : { data: {} })
    elsif params_exist(params[:google_id])
      parent = Parent.search_google_id(params[:google_id])
      render json: (parent ? ParentSerializer.new(parent) : { data: {} })
    else
      render_bad_request('valid parent params not given')
    end
  end


  private

  # def find_parent
  #   @parent = Parent.find(params[:id])
  # end

  def parent_params
    params.permit(:first_name, :last_name, :email, :address, :phone_number, :google_id, :google_image_url)
  end
end
