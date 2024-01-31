class Notification < ApplicationRecord
  after_create :stream_notification


  private
 
 
  def stream_notification
    message_data = {
      user: self.user,
      message: self.message,
    }
 
 
    ActionCable.server.broadcast "notifications_#{self.user}", message_data
  end

end

