class Public::CustomersController < ApplicationController
  
  def show
     @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end
  
  def unsubscribe
    
  end
  
  def withdraw
    @customer = current_customer
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_delete: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)
  end
end
