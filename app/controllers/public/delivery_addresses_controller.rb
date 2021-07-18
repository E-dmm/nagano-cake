class Public::DeliveryAddressesController < ApplicationController
  
  def index
    @delivery_addresses = DeliveryAddress.all
  end
  
  
  def create
    @delivery_address = @delivery_address.new
    @delivery_address.save
    redirect_to public_delivery_addresses_path
  end
  
  def edit
    @delivery_address = Delivery_address.find(params[:id])
  end
  
  def update
    @delivery_address = Delivery_address.find(params[:id])
    @delivery_address.update(delivery_address_params)
    redirect_to public_delivery_addresses_path
  end
  
  def destroy
    @delivery_address = Delivery_address.find(params[:id])
    @delivery_address.destroy
    redirect_to public_delivery_addresses_path
  end
  
  private
  
  def delivery_address_params
    params.require(:delivery_address).permit(:postcode, :address, :name)
  end
end
