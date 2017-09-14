class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.string :sex
      t.string :petfinder_num
      t.string :mix
      t.integer :breed_id
      t.timestamps null: false
    end
  end
end
