class CreateDogs < ActiveRecord::Migration[6.1]
  def change

    create_table :dogs do |t|
      t.integer :id_of_dog
      t.string :primary_key
      t.integer :id_of_owner
      t.text :name_of_dog
      t.integer :age_of_dog
      t.text :breed_of_dog
      t.text :bio_of_dog
      t.integer :location_postCode
      t.text :dates_require_dogSitting

      t.timestamps
    end

  end
end
