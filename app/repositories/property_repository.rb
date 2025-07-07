class PropertyRepository
  def self.all_active
    Property.includes(:user, :offers)
  end

  def self.find_by_user(user)
    Property.where(user: user).includes(:offers)
  end

  def self.find_with_offers(id)
    Property.includes(:user, :offers).find(id)
  end

  def self.create(attributes)
    Property.create(attributes)
  end

  def self.update(property, attributes)
    property.update(attributes)
  end

  def self.destroy(property)
    property.destroy
  end
end
