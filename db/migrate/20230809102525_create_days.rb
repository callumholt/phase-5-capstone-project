class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :workout, null: false, foreign_key: true
      t.integer :dayNumber

      t.timestamps
    end
  end
end
