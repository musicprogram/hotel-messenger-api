class ChatRoom < ApplicationRecord
    validates :name,
      uniqueness: { message: "ya está en uso" },
      presence: { message: "no puede estar en blanco" }
  end
