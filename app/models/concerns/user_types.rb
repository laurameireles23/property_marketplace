module UserTypes
  extend ActiveSupport::Concern

  included do
    scope :vendedores, -> { where(user_type: 'vendedor') }
    scope :compradores, -> { where(user_type: 'comprador') }
  end

  def vendedor?
    user_type == 'vendedor'
  end

  def comprador?
    user_type == 'comprador'
  end
end
