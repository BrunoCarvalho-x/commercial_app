class User < ApplicationRecord
  devise :confirmable, :database_authenticatable,
         :lockable, :omniauthable,
         :recoverable, :registerable,
         :rememberable, :timeoutable,
         :trackable, :validatable

  has_many :orders
end
