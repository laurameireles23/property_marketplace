class OffersController < ApplicationController
  before_action :set_property, only: [:new, :create]
  before_action :set_offer, only: [:show, :accept, :reject]
  before_action :ensure_comprador, only: [:new, :create]

  def index
    @offers = Offer.includes(:property, :user).all
  end

  def show; end

  def new
    @offer = Offer.new
    @compradores = User.compradores
  end

  def create
    @compradores = User.compradores
    result = OfferService.create_offer(User.find(params[:offer][:user_id]), @property, offer_params)

    if result[:success]
      redirect_to @property, notice: 'Oferta enviada com sucesso!'
    else
      @offer = Offer.new(offer_params)
      flash.now[:alert] = result[:errors].join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    result = OfferService.accept_offer(@offer)

    if result[:success]
      redirect_to @offer.property, notice: 'Oferta aceita com sucesso!'
    else
      redirect_to @offer.property, alert: result[:errors].join(', ')
    end
  end

  def reject
    result = OfferService.reject_offer(@offer)

    if result[:success]
      redirect_to @offer.property, notice: 'Oferta rejeitada!'
    else
      redirect_to @offer.property, alert: result[:errors].join(', ')
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:value)
  end

  def current_user
    User.where(user_type: 'comprador').first || User.create(email: 'comprador@example.com', name: 'Comprador', user_type: 'comprador')
  end

  def ensure_comprador
    unless current_user.comprador?
      redirect_to @property, alert: 'Apenas compradores podem fazer ofertas.'
    end
  end
end
