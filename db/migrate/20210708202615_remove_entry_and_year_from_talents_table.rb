class RemoveEntryAndYearFromTalentsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :talents, :entry
    remove_column :talents, :year
    add_column :talents, :entry_year, :string
  end
end
