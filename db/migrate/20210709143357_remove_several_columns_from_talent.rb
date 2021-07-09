class RemoveSeveralColumnsFromTalent < ActiveRecord::Migration[6.1]
  def change
    remove_column :talents, :intern
    remove_column :talents, :grad_year
    remove_column :talents, :institution
    remove_column :talents, :level
    remove_column :talents, :course
    remove_column :talents, :entry_year
    add_column :talents, :leadership, :string
  end
end
