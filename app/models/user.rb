class User < ApplicationRecord
  has_secure_password
  has_one :player

  def full_name
    '#{first_name} #{last_name}'  
  end


end
