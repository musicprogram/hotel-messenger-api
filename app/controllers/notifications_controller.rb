class NotificationsController < ApplicationController
  #skip_before_action :verify_authenticity_token


  def create
    return head :bad_request unless params[:message] && params[:user]


    Notification.create!(
      user: params[:user],
      message: params[:message]
    )


    head :ok
  end
 end
