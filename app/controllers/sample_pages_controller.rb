class SamplePagesController < ApplicationController
  def index
  end

  def purchase
  	WebPay.api_key = WEBPAY_SECRET_KEY
  	WebPay::Charge.create(currency: 'jpy', amount: 1000, card: params['webpay-token'])
  	redirect_to action: :purchased
  end

  def purchasedredirect_to action: :purchased
  end
end
