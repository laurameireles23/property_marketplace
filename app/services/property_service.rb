class PropertyService
  def self.create_property(user, attributes)
    return { success: false, errors: ['Usuário deve ser vendedor'] } unless user.user_type == 'vendedor'

    property = PropertyRepository.create(attributes.merge(user: user))

    if property.persisted?
      { success: true, property: property }
    else
      { success: false, errors: property.errors.full_messages }
    end
  end

  def self.update_property(property, attributes)
    result = PropertyRepository.update(property, attributes)

    if result
      { success: true, property: property }
    else
      { success: false, errors: property.errors.full_messages }
    end
  end

  def self.delete_property(property)
    PropertyRepository.destroy(property)
    { success: true }
  end
end
