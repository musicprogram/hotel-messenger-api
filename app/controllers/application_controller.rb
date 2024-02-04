class ApplicationController < ActionController::API
  before_action :authenticate_user!, unless: :messages_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception, status: 'authorization_failed'}
  end
  private

  def messages_controller?
    controller_name == 'messages'
  end
end
