class CreateUserPets < ActiveRecord::Migration
  def change
    create_table :user_pets do |t|
      t.integer :user_id
      t.integer :pet_id
      t.timestamps null: false
    end
  end
end
