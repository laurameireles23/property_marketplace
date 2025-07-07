class OfferRepository
  def self.find_by_user(user)
    Offer.includes(:property, :user).where(user: user)
  end

  def self.find_by_property(property)
    Offer.includes(:user).where(property: property)
  end

  def self.find_pending_by_property(property)
    Offer.where(property: property, status: 'pending')
  end

  def self.create(attributes)
    Offer.create(attributes)
  end

  def self.update(offer, attributes)
    offer.update(attributes)
  end

  def self.destroy(offer)
    offer.destroy
  end
end
