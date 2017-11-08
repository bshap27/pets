class AddStatusToPets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.string :status
    end
  end
end
