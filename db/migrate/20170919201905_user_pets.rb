class UserPets < ActiveRecord::Migration
  def change
    create_table :user_pets do |t|
      t.integer :pet_id
      t.integer :breed_id
      t.timestamps null: false
    end
  end
end
