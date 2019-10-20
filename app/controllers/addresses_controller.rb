class AddressesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @addresses = Address.all
  end


  def edit
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to user_addresses_path(@user.id)
  end

  def show
  	@user =User.find(params[:user_id])
    @address =Address.new

  end

  def destroy
    user = User.find(params[:user_id])
    address =Address.find(params[:id])
    address.destroy
    redirect_to user_addresses_path(user)


  end

  def new
    @user = User.find(params[:user_id])
    @address =Address.new

  end

  def create
    @address = current_user.addresses.new(address_params)
    @address.save
    redirect_to user_addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:id,  :pulldown_name, :family_name,:first_name,:family_name_kana, :first_name_kana, :post, :a_address, :phone, :user_id)
  end
end
