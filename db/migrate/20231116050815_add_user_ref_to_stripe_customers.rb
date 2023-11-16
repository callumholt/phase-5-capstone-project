class AddUserRefToStripeCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :stripe_customers, :user, null: false, foreign_key: true
  end
end
