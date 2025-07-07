class User < ApplicationRecord
  include UserTypes

  has_many :properties, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :user_type, presence: true, inclusion: { in: %w[comprador vendedor] }
end
