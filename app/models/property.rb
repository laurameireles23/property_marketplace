class Property < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy

  validates :title, :address, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
