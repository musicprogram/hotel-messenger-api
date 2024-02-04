# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    # Permiso para cualquier usuario, incluso no autenticado, para crear mensajes
    can :manage, Message
    if user.admin?
      can :manage, :all
    end
  end
end
