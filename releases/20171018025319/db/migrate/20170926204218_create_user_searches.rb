class CreateUserSearches < ActiveRecord::Migration
  def change
    create_table :user_searches do |t|
      t.integer :user_id
      t.string :name
      t.string :search
      t.timestamps null: false
    end
  end
end
