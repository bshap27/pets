class CreateUserBreeds < ActiveRecord::Migration
  def change
    create_table :user_breeds do |t|
      t.integer :user_id
      t.integer :breed_id
      t.timestamps null: false
    end
  end
end
