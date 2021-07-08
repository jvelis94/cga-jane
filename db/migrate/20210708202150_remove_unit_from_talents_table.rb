class RemoveUnitFromTalentsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :talents, :unit
    remove_column :talents, :business
    add_column :talents, :business_unit, :string

  end
end
