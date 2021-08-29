class DonationsController < ApplicationController
  before_action :set_publication
  before_action :set_donation, only: %i[ show edit update destroy checkout pay ]
  skip_before_action :verify_authenticity_token
  before_action :paypal_init, :except => [:index]


  def index
      @donations = @publication.donations.confirmed
  end

  def show
  end

    # GET 
  def new
    @donation = @publication.donations.new
  end

  # GET 
  def edit
  end

  # POST 
  def create
    @donation = @publication.donations.new(donation_params)
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to checkout_publication_donation_path(@publication, @donation) }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to [@publication, @donation], notice: "Donation was successfully updated." }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE 
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to publication_donations_path(@publication), notice: "Donation was successfully destroyed." }
      format.json { head :no_content }
      format.js {}
    end
  end

  def checkout
  end


  def pay
    amount = @donation.amount
    request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
    request.request_body({
      :intent => 'CAPTURE',
      :purchase_units => [
        {
          :amount => {
            :currency_code => 'USD',
            :value => amount
          }
        }
      ]
    })
    begin
      response = @client.execute request
      @donation.token = response.result.id
      # donation.status = 'pending' (crear enum status: 'pending', 'confirmed', 'failed')
      if @donation.save
        return render json: {token: response.result.id}, status: :ok
      end
    rescue PayPalHttp::HttpError => _
      # HANDLE THE ERROR
    end
  end

  def capture
    token = params[:token]
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new token
    begin
      response = @client.execute request
      donation = Donation.find_by(token: token)
      donation.paid = response.result.status == 'COMPLETED'
      if donation.save
        return render :json => {:status => response.result.status}, :status => :ok
      end
    rescue PayPalHttp::HttpError => _
      # HANDLE THE ERROR
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation =  @publication.donations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.require(:donation).permit(:amount)
    end

    def set_publication
        @publication = Publication.find(params[:publication_id])
    end

    
  def paypal_init
    client_id = 'AYW1NlwxvS3yXvwhvSLs1hQoWmF77A8mVy4nUHEgm2izlaCB3lVIuPD9oO5O4ZXusZqnTlonaCB6FICF'
    client_secret = 'EHJ_FigLj4LG7FhyoK45rVOgCmX-lr5r12CWBhBwup2sNu0T0h-9ukpMbPMbovY4_i8guvZeErzGxYxC'
    environment = PayPal::SandboxEnvironment.new client_id, client_secret
    @client = PayPal::PayPalHttpClient.new environment
  end
end