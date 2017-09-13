class ChangePets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.column :breed_id, :integer
    end
  end
end
