class OfferService
  def self.create_offer(user, property, attributes)
    return { success: false, errors: ['Usuário deve ser comprador'] } unless user.user_type == 'comprador'
    return { success: false, errors: ['Não pode fazer oferta no próprio imóvel'] } if user == property.user

    offer = OfferRepository.create(attributes.merge(user: user, property: property, status: 'pending'))

    if offer.persisted?
      { success: true, offer: offer }
    else
      { success: false, errors: offer.errors.full_messages }
    end
  end

  def self.accept_offer(offer)
    return { success: false, errors: ['Oferta já foi processada'] } unless offer.status == 'pending'

    offer.update(status: 'accepted')
    { success: true, offer: offer }
  end

  def self.reject_offer(offer)
    return { success: false, errors: ['Oferta já foi processada'] } unless offer.status == 'pending'

    offer.update(status: 'rejected')
    { success: true, offer: offer }
  end
end
