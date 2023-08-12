class CreateSetsCompleteds < ActiveRecord::Migration[6.1]
  def change
    create_table :sets_completeds do |t|
      t.references :exercise, null: false, foreign_key: true
      t.decimal :weight
      t.integer :reps

      t.timestamps
    end
  end
end
