class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @properties = PropertyRepository.find_by_user(@user) if @user.user_type == 'vendedor'
    @offers = OfferRepository.find_by_user(@user) if @user.user_type == 'comprador'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :phone, :user_type)
  end
end
