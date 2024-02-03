# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
    render json: {
      status: { code: 200, message: "User signed in successfully", data: current_user }
    }, status: :ok
  end

  def respond_to_on_destroy
    begin
    token = request.headers['Authorization'].split(' ')[1]
    jwt_payload = JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: "Signed out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User has no active session"
      }, status: :unauthorized
    end
  rescue JWT::DecodeError => e
    render json: {
      status: 401,
      message: "Token decode error: #{e.message}"
    }, status: :unauthorized
  rescue ActiveRecord::RecordNotFound => e
    render json: {
      status: 401,
      message: "User not found: #{e.message}"
    }, status: :unauthorized
  end
  end
end
