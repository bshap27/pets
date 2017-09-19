class AddsNewToPets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.column :new_pet, :boolean
    end
  end
end
