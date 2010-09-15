class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end
  
  def show
    @donation = Donation.find(params[:id])
  end

  def create_express
    @donation = Donation.new(params[:donation])
    @donation.ip_address = request.remote_ip
    response = EXPRESS_GATEWAY.setup_purchase(0,
    :ip => request.remote_ip,
    :return_url => donation_url(Donation.find(@donation.id)),
    :cancel_return_url => brides_url)
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  def new
    @donation = Donation.new(:gift_id => params[:gift_id], :express_token => params[:token])
  end
  
  def create
    @donation = Donation.new(params[:donation])
    @donation.ip_address = request.remote_ip
    (params[:commit] == "paypal_express")? @donation.paypal_donation = true : @donation.paypal_donation = false

    @donation.user = current_user
    if @donation.save
      unless @donation.paypal_donation
        if @donation.submit_donation
          render :action => "success"
        else
          render :action => "failure"
        end
      else
        response = EXPRESS_GATEWAY.setup_purchase( 0,
            :ip => request.remote_ip,
            :return_url => paypal_response_donation_url(@donation),
            :cancel_return_url => brides_url)
          redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
      end
    end
  end
  
  def paypal_response
    @donation = Donation.find(params[:id])
    @donation.express_token = params[:token]
    @donation.express_payer_id = params[:PayerID]
    @donation.save
    if @donation.submit_donation
      redirect_to bride_url(@donation.gift.bride_id)
      render :action => "notify_friends"
    else
      render :action => "failure"
    end
  end
  
  def notify_friends
    
    
    #redirect_to bride_url(@current_user.donations.last.gifts.last.bride_id)
  end

  def edit
    @donation = Donation.find(params[:id])
  end
  
  def update
    @donation = Donation.find(params[:id])
    if @donation.update_attributes(params[:donation])
      flash[:notice] = "Successfully updated donation."
      redirect_to @donation
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    flash[:notice] = "Successfully destroyed donation."
    redirect_to donations_url
  end
end
