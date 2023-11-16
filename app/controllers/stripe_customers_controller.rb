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
    when 'checkout.session.completed'
        subscription = event.data.object
        handle_checkout_session_completed(subscription)
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }, status: :ok
  end
      
        private
      
        
        
        def handle_checkout_session_completed(checkout_session)
            # Extract the Stripe customer ID, email, and name from the checkout session
            stripe_customer_id = checkout_session.customer
            customer_email = checkout_session.customer_details.email
            customer_name = checkout_session.customer_details.name
          
            # Find or initialize a StripeCustomer record
            stripe_customer = StripeCustomer.find_or_initialize_by(stripe_customer_id: stripe_customer_id)
          
            # Update email and name if available
            stripe_customer.email = customer_email if customer_email.present?
            stripe_customer.name = customer_name if customer_name.present?
          
            # Save the StripeCustomer record
            if stripe_customer.save
              # Check if there's an associated User record
              user = stripe_customer.user
          
              if user.present?
                # Update the user's 'subscribed' status to true
                user.update(subscribed: true)
              else
                # Handle the case where there's no associated User record
                Rails.logger.warn "No associated user found for Stripe customer ID #{stripe_customer_id}"
                # Additional error handling...
              end
            else
              # Handle save failure, e.g., log errors or take other actions
              Rails.logger.error "Failed to save StripeCustomer record for ID #{stripe_customer_id}"
            end
        end
          
    end
      


