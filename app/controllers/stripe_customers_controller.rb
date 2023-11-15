class StripeCustomersController < ApplicationController
        # skip_before_action :verify_authenticity_token
      
        def webhook
          payload = request.body.read
          sig_header = request.env['HTTP_STRIPE_SIGNATURE']
          event = nil
      
          begin
            event = Stripe::Event.construct_from(
              JSON.parse(payload, symbolize_names: true)
            )
          rescue JSON::ParserError => e
            # Invalid payload
            puts "⚠️  Webhook error while parsing basic request. #{e.message}"
            status 400
            return
          end
        
      
          # Handle the event
    case event.type
    when 'customer.created'
      customer = event.data.object # Extracting the customer data from the event
      handle_customer_created(customer)
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }, status: :ok
  end
      
        private
      
        def handle_customer_created(customer)
            # Check if email and name are present before creating a record
            if customer.email.present? && customer.name.present?
              StripeCustomer.create(email: customer.email, name: customer.name)
            else
              # Handle the case where email or name is missing
              Rails.logger.warn "Received a customer.created event with missing email or name: #{customer.inspect}"
              # You might want to raise an error or take some other action here
            end
          end
          
    end
      


