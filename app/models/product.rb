class Product
  attr_accessor :amount, :currency, :description
  def initialize
    set_xfers_config
  end

  def charge(user_api_token:)
    Xfers::Charge.create(
        :amount => amount,
        :currency => currency, # Refence https://currencysystem.com/codes/
        :order_id => SecureRandom.hex(5),
        :description => description,
        :return_url => 'http://localhost:3000/shop/success',
        :user_api_token => user_api_token
      )
  end

  private
    def set_xfers_config
      Xfers.set_api_key '3dehFLadwsxNUWe_sSp5ymBaQJB8yLzPyM1sRgkTDPk'
      Xfers.set_id_sandbox # Set the sandbox to id region
    end
end