class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = PropertyRepository.all_active
  end

  def show
    @offers = OfferRepository.find_by_property(@property)
  end

  def new
    @property = Property.new
    @vendedores = User.vendedores
  end

  def create
    @vendedores = User.vendedores
    result = PropertyService.create_property(User.find(params[:property][:user_id]), property_params)

    if result[:success]
      redirect_to result[:property], notice: 'Imóvel criado com sucesso!'
    else
      @property = Property.new(property_params)
      flash.now[:alert] = result[:errors].join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    result = PropertyService.update_property(@property, property_params)

    if result[:success]
      redirect_to @property, notice: 'Imóvel atualizado com sucesso!'
    else
      flash.now[:alert] = result[:errors].join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    PropertyService.delete_property(@property)
    redirect_to properties_path, notice: 'Imóvel removido com sucesso!'
  end

  private

  def set_property
    @property = PropertyRepository.find_with_offers(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :address, :price)
  end

  def current_user
    User.first || User.create(email: 'test@example.com', name: 'Test User', user_type: 'vendedor')
  end
end
