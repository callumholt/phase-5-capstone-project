class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      
      t.text :name
      t.text :bio
      t.integer :postcode
      t.timestamps
    end
  end
end
