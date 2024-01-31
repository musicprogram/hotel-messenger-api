class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  ROLES = %W{admin client}


  def jwt_payload
    super
  end

#  def admin?
#    role == 'admin'
#  end
#  se crean los metodos de cada elemento del array
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end


end
