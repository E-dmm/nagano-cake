class Public::SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, 'partical')
  end

  private
  
  def partical(model, method)
    if model == 'product'
      Product.where("name LIKE ?", "%#{@content}%")
    elsif model == 'genre'
      Genre.where("name LIKE ?", "%#{@content}%")
    end
  end
  
  def search_for(model, content, method)
    # if model == 'product'
    #   if method == 'perfect'
    #     Product.where(name: content)
    #   else
    #     Product.where('name LIKE ?', '%'+content+'%')
    #   end
    # end
     case method
      when 'perfect'
        perfect_match(model,content )
      when 'forward'
        forward(model, content)
      when 'backward'
        backward(model, content)
      when 'partical'
        partical(model, content)
     end
  end
end
