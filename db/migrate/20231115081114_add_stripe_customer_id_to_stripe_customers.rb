class AddStripeCustomerIdToStripeCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :stripe_customers, :stripe_customer_id, :string
  end
end
