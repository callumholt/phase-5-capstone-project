class DropSetsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :exercise_sets
  end
end
