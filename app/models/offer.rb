class Offer < ApplicationRecord
  belongs_to :user # Comprador
  belongs_to :property

  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending accepted rejected] }
  validate :only_one_accepted_offer_per_property, if: -> { status == 'accepted' }

  private

  def only_one_accepted_offer_per_property
    if Offer.where(property_id: property_id, status: 'accepted').where.not(id: id).exists?
      errors.add(:base, 'Já existe uma oferta aceita para este imóvel.')
    end
  end
end
