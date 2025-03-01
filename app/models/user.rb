class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :memberships, dependent: :destroy
    has_many :rentals, class_name: :Rental, foreign_key: :user_id
  
  def subscribed?
    memberships.where(status: 'active').any?
  end 
  
end


