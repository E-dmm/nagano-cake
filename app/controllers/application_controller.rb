class ApplicationController < ActionController::Base
  before_action :set_search


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  def set_search
    #以下は検索に使うときの記述（変数やモデル名は変更してもいいですが
    #".ransack(params[:q])"はそのままで使用します。）
    @search = Product.ransack(params[:q])
    #以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
    @search_products = @search.result
  end

end

