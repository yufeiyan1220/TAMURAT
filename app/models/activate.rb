class Activate < ApplicationRecord
    
  def Activate.new_token
    SecureRandom.urlsafe_base64
  end
  
  def Activate.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end