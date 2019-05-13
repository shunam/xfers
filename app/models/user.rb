class User
  def initialize
    set_xfers_config
    begin
      @user = Xfers::User.retrieve
    rescue Xfers::XfersError => e
      puts e.to_s
    end
  end

  def id
    @user[:id]
  end

  def balance
    @user[:available_balance]
  end

  private
    def set_xfers_config
      # ASSUMPTION: because I don't create the login page
      # I set the api key in here.
      # in the future, will try to integrate the api key with gem "devise"
      # so when user login, I will set the api key in current_user
      Xfers.set_api_key 'gvPLaHoa7gX5F63aSM6v_ZQq9s2X4X74ztTvyfrgY2E'
      Xfers.set_id_sandbox # Set the sandbox to id region
    end
end