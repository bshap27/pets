class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.datetime :sitecreated
      t.string :petname
      t.string :breed
      t.timestamps null: false
    end
  end
end
