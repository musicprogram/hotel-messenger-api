class Message < ApplicationRecord

  after_create  :updateHour, :stream_notification

  private

  def updateHour
    self.hourCreated = format_hour(self.created_at)
    save # Guarda el registro actualizado
  end

  def stream_notification

    message_data = {
      chat_room_id: self.chat_room_id,
      content: self.content,
      emisor: self.emisor,
      hourCreated: self.hourCreated
    }

    ActionCable.server.broadcast "messages_#{self.chat_room_id}", message_data
  end

  def format_hour(created_at)
    # Suponiendo que created_at es la fecha en tu objeto Rails
    fecha_rails = created_at.to_time

    # Formatear la fecha en Ruby on Rails con indicador AM/PM
    hora_formateada = fecha_rails.strftime('%I:%M %p')
    return hora_formateada
  end

end
