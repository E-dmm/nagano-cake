class Public::OrdersController < ApplicationController

  def index
	@orders = Order.all.page(params[:page]).per(5)
  end


  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def new
  	@order = Order.new
    @cart_products = current_customer.cart_products
  end

  def confirm
     @order =Order.new(order_params)
    @cart_products = CartProduct.where(customer_id:[current_customer.id])
    @total_price = 0
		@cart_products.each do |cart_product|
			@total_price += (cart_product.product.price * 1.1).floor * cart_product.quantity
		end
		@shipping = 800
# 		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		@order.shipping = @shipping
		if params[:order][:a_method] == "0"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.address_name = current_customer.last_name + current_customer.first_name
		elsif params[:order][:a_method] == "1"
			address = DeliveryAddress.find(params[:order][:delivery_address_id])
			@order.postcode = address.postcode
			@order.address = address.address
			@order.address_name = address.name
		end
		if !@order.postcode.present? || !@order.address.present? || !@order.address_name.present?
			render :new
		end

  end


  def create
  	order = Order.new(order_params)
  	order.order_status = "入金待ち"
    order.save
    cart_products = current_customer.cart_products.all
      cart_products.each do |cart_product|
        ordered_products = order.ordered_products.new
        ordered_products.product_id = cart_product.product.id
        ordered_products.price = cart_product.product.price
        ordered_products.quantity = cart_product.quantity
        ordered_products.save
      end
    current_customer.cart_products.destroy_all
  	redirect_to orders_thanks_path
  end

	def thanks
	end


	private

	def order_params
		params.require(:order).permit(:payment, :postcode, :address, :address_name, :total_price, :order_status, :customer_id, :shipping)
	end

end

