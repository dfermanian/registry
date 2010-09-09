class Donation < ActiveRecord::Base
  #attr_accessible :ip_address, :first_name, :last_name, :card_type, :card_expiration
  
  belongs_to :gift
    
  has_many :transactions, :class_name => "DonationTransaction", :dependent => :destroy
  
  attr_accessor :card_number, :card_verification

  validate_on_create :validate_card, :unless => :paypal?

  validates_numericality_of :amount, :greater_than => 0

  def submit_donation
    submit_request = process_donation
    submit_request.success?
  end

  def price_in_cents
    (amount*100).round
  end

  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end

  def paypal?
    if card_number.blank? && card_verification.blank?
      true
    else
      validate_card
    end
  end

  private

  def process_donation
    if express_token.blank?
      response = STANDARD_GATEWAY.purchase(price_in_cents, credit_card, standard_purchase_options)
      transactions.create!(:action => "submit_donation", :amount => price_in_cents, :response => response)
    else
      response = EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
      transactions.create!(:action => "submit_express_donation", :amount => price_in_cents, :response => response)
    end
  end

  def standard_purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name => "Freddy Hernandez",
        :address1 => "516 glenrock",
        :city => "los angeles",
        :state => "CA",
        :country => "US",
        :zip => "90024"
      }
    }
  end

  def express_purchase_options
    {
      :ip => ip_address,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end

  def validate_card
    if express_token.blank? && !credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
    :type => card_type,
    :number => card_number,
    :verification_value => card_verification,
    :month => card_expiration.month,
    :year => card_expiration.year,
    :first_name => first_name,
    :last_name => last_name
    )
  end
end