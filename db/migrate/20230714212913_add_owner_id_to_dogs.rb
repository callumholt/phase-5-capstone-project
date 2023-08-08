class AddOwnerIdToDogs < ActiveRecord::Migration[6.1]
  def change
    # add_reference :dogs, :owner, foreign_key: true
    add_column :dogs, :owner_id, :string
  end
end
