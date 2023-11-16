class StripeCustomer < ApplicationRecord
    # You can add validations, associations, or custom methods here if needed
  
    # For example, basic validations might include:
    validates :email, presence: true
    validates :name, presence: true
    belongs_to :user

  
    # Add any other model-level logic you require.
  end
  