class Public::OrdersController < ApplicationController
	
	def index
		@orders = current_customer.orders
		@order_day = @orders.created_at.strftime('%Y/%m/%d')
		@product = @orders.pr
	end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
    @customer = current_customer
    @order_day = @order.created_at.strftime('%Y/%m/%d')
  end

  def new
    @cart_products = current_customer.cart_products
  end

  def confirm
    @cart_products = CartProduct.where(customer_id:[current_customer.id])
    @total_price = 0
		@cart_products.each do |cart_product|
			@total_price += (cart_product.product.price * 1.1).floor * cart_product.quantity
		end
		@shipping = 800
		@order = order.new(order_params)
		if @order.a_method == 0
			@order.postcode = customer.postcode
			@order.address = customer.address
			@order.address_name = customer.last_name + customer.first_name
		elsif @order.a_method == 1
			address = CartProduct.find(customer_id:[delivery_address.id])
			@order.postcode = address.postcode
			@order.adress = address.address
			@order.name = address.name
		elsif @order.a_method == 2
			@order.postcode = postcode
			@order.address = address
			@order.name = name
		end
		if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
			redirect_to orders_confirm_path
		else
			redirect_to new_order_path
		end
  end

  def create
  end

	def thanks
		order = Order.new(order_params)
		order.save
		if @order.method == 2
			delivery_address.postcode = order.postcode
			delivery_address.address = order.address
			delivery_address.name = order.name
			delivery_address.save
			session[:new_address] = nil
		end
		cart_products = current_customer.cart_products
		cart_products.each do |cart_product|
			ordered_products = OrderedProducts.new
			ordered_products.order_id = order.id
			ordered_products.product_id = cart_product.product.id
			ordered_products.quantity = cart_product.quantity
			ordered_products.production_status = 0
			ordered_products.price = (cart_product.product.price * 1.1).floor
			ordered_products.save
		end
		cart_products.all_destroy
	end


	def index
		@orders = current_customer.orders
	end

	private

	def order_params
		params.require(:order).permit(:payment, :postcode, :address, :address_name, :total_price, :a_method)	end


end
