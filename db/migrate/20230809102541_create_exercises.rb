class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.references :day, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
