class CreatePetBreeds < ActiveRecord::Migration
  def change
    create_table :pet_breeds do |t|
      t.integer :pet_id
      t.integer :breed_id
      t.timestamps null: false
    end
  end
end
