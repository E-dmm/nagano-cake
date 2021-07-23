class Public::OrdersController < ApplicationController
	
	def index
		@orders = current_customer.orders
		@customer = current_customer
	end

	def index
		@orders = Order.page(params[:page]).per(5)
		# @order_day = @orders.created_at.strftime('%Y/%m/%d')
		# @product = @orders.product
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

  def create
		customer = current_customer
		session[:order] = Order.new
		cart_products = current_customer.cart_products
		sum = 0
		cart_products.each do |cart_products|
			sum += (cart_product.product.price * 1.1).floor * cart_product.quantity
		end
		session[:order][:shipping] = 800
		session[:order][:total_payment] = sum + session[:order][:shipping]
		session[:order][:order_status] = 0
		session[:order][:customer_id] = current_customer.id
		session[:order][:payment_method] = params[:method].to_i
		destination = params[:a_method].to_i
		if destination == 0
			session[:order][:post_code] = customer.postcode
			session[:order][:address] = customer.address
			session[:order][:name] = customer.last_name + customer.first_name
		elsif destination == 1
			address = DeliveryAddress.find(params[:delivery_address_for_order])
			session[:order][:post_code] = address.postcode
			session[:order][:address] = address.address
			session[:order][:name] = address.name
		elsif destination == 2
			session[:new_address] = 2
			session[:order][:post_code] = params[:post_code]
			session[:order][:address] = params[:address]
			session[:order][:name] = params[:name]
		end
		if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
			redirect_to public_orders_confirm_path
		else
			redirect_to new_public_order_path
		end
  end

  def confirm
      @cart_products = CartProduct.where(customer_id:[current_customer.id])
  end


	def thanks
		order = Order.new(session[:order])
		order.save
		if session[:new_address]
			delivery_address = current_customer.delivery_addresses.new
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
		cart_products.destroy_all
	end

<<<<<<< HEAD

=======
>>>>>>> 12f9aaae84d99c0126aa9fabac4ea74d47cb62ba
end
