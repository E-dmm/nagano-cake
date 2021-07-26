class Public::SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  
  def search_for(model, content, method)
    if model == 'product'
      if method == 'perfect'
        Product.where(name: content)
      else
        Product.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end
