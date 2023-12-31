class CreateExerciseSets < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_sets do |t|
      t.references :exercise, null: false, foreign_key: true
      t.decimal :weight
      t.integer :reps

      t.timestamps
    end
  end
end
