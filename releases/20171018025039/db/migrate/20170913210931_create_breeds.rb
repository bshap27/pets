class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.boolean :hub_exclude
      t.timestamps null: false
    end
  end
end
