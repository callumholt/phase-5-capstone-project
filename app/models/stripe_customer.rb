class StripeCustomersController < ApplicationController
    # skip_before_action :verify_authenticity_token
  
    def webhook
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil
  
      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, Rails.application.credentials.stripe[:signing_secret]
        )
      rescue JSON::ParserError, Stripe::SignatureVerificationError => e
        render json: { error: e.message }, status: :bad_request
        return
      end
  
      # Handle the event
      case event.type
      when 'customer.created'
        handle_customer_created(event.data.object)
      else
        puts "Unhandled event type: #{event.type}"
      end
  
      render json: { message: 'success' }, status: :ok
    end
  
    private
  
    def handle_customer_created(customer)
        # Create a new StripeCustomer record with the data received from the Stripe event
        StripeCustomer.create(
          email: customer.email,
          name: customer.name
        )
      
    end
  end
  