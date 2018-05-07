class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    # See if they are upgrading to Paid
    shopify_service = ShopifyIntegration.new(url: @account.shopify_account_url,
                                             password: @account.shopify_password,
                                             account_id: @account.id)

    shopify_service.connect
    if params[:account][:paid] == true || params[:account][:paid].to_i == 1
      if @account.paid?
        render 'edit'
      else
        # TODO: set the flag to false to really charge the card
        redirect_to shopify_service.create_charge(1, true)
      end
    else
      # If not, just re-render the form
      if shopify_service.delete_charge(@account.charge_id)
        puts "asdfasdfsdfasdfsdfasdfsdfsdf"
        @account.update_attribute(:paid, false)
      end

      render 'edit'
    end
  end


  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_account
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:shopify_account_url, :shopify_shared_secret, :shopify_api_key, :shopify_password)
    end
end
