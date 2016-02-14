class SubscribesController < ApplicationController
  layout 'public'

  def new    
    @subscribe = Subscribe.new
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    # FIXME
    begin
      Stripe.api_key = ENV['SECRET_KEY']
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      Stripe::Charge.create(
        customer: customer.id,
        amount: @subscribe.amount,
        currency: "usd",
        source: params[:stripeToken],
        description: "Donation charge for #{@subscribe.email}"
      )
      @subscribe.save
      flash[:warning] = "You've registered!"
      redirect_to new_subscribe_path
    rescue Stripe::CardError => e
      flash.now[:danger] = "Please check your payment information!"
      render :new
    end
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:email, :amount)
  end
end