class ShopController < ApplicationController
  before_action :set_sample_product

  def index
  end

  def purchase
    if params[:id] == 'food'
      if check_balance(product: @food)
        redirect_to shop_balance_not_enough_path 
      else
        redirect_to @food.charge(user_api_token: 'gvPLaHoa7gX5F63aSM6v_ZQq9s2X4X74ztTvyfrgY2E')[:return_url]
      end
    else
    end
  end

  def balance_not_enough
  end

  def success

  end

  def check_balance(product:)
    @user.balance.to_f <= product.amount.to_f
  end

  def set_sample_product
    @food = Product.new
    @food.amount = 1000000
    @food.currency = 'IDR'
    @food.description = 'Food'
  end
end
