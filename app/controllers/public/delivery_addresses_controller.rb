class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_addresses = DeliveryAddress.all
  end


  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.save
    redirect_to public_delivery_addresses_path
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.update(delivery_address_params)
    redirect_to public_delivery_addresses_path
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to public_delivery_addresses_path
  end

  private

  def delivery_address_params
    params.permit(:postcode, :address, :name)
    #エラーが起きたためrequire消しました
  end
end
