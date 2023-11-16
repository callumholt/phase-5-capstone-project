class User < ApplicationRecord
    has_one :workout, dependent: :destroy
    has_one :stripe_customer, class_name: 'StripeCustomer', foreign_key: 'user_id'

    has_secure_password
end
