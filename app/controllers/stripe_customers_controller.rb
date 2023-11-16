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
    when 'customer.subscription.updated'
        subscription = event.data.object
        handle_subscription_updated(subscription)
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }, status: :ok
  end
      
        private
      
        def handle_customer_created(customer)
            # Check if email and name are present before creating a record
            if customer.email.present? && customer.name.present?
              StripeCustomer.create(email: customer.email, name: customer.name, stripe_customer_id: customer.id)
            else
              # Handle the case where email or name is missing
              Rails.logger.warn "Received a customer.created event with missing email or name: #{customer.inspect}"
              # You might want to raise an error or take some other action here
            end
          end
        
          def handle_subscription_updated(subscription)
            # Extract the Stripe customer ID from the subscription
            stripe_customer_id = subscription.customer
          
            # Find the StripeCustomer record associated with this Stripe customer ID
            stripe_customer = StripeCustomer.find_by(stripe_customer_id: stripe_customer_id)
          
            if stripe_customer.present?
              # Assuming there's an association to a User record, like stripe_customer.user
              user = stripe_customer.user
          
              if user.present?
                # Determine the new subscription status
                # You may need to adjust this logic based on how you determine subscription status
                new_subscribed_status = determine_subscription_status(subscription)
          
                # Update the user's 'subscribed' status
                user.update(subscribed: new_subscribed_status)
              else
                # Handle the case where there's no associated User record
                Rails.logger.warn "No associated user found for Stripe customer ID #{stripe_customer_id}"
                # Additional error handling...
              end
            else
              # Handle the case where no StripeCustomer is found for the given Stripe customer ID
              Rails.logger.warn "No StripeCustomer found for Stripe customer ID #{stripe_customer_id}"
              # Additional error handling...
            end
          end
          
          private
          
          def determine_subscription_status(subscription)
            # Implement logic to determine subscription status based on the subscription object
            # This might depend on specific fields in the subscription object like 'status'
            subscription.status == 'active'
          end
          
          
    end
      


