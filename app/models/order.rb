class Order < ApplicationRecord
  belongs_to :user

  validates :client_name, presence: true
  validates :description, presence: true
  validates :delivery_date, presence: true
  validates :delivery_hour, presence: true
  validates :value, presence: true
end
