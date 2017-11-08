class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :petfinderid
      t.string :name
      t.string :city
      t.string :state
      t.string :zip
      t.string :description
      t.string :sex
      t.string :size
      t.string :mix
      t.string :animal
      t.string :primary_photo
      t.string :age
      t.boolean :new_pet
      t.timestamps null: false
    end
  end
end
