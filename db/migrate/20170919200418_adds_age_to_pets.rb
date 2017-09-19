class AddsAgeToPets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.column :age, :string
    end
  end
end
