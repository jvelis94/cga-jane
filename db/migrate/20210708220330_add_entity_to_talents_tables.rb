class AddEntityToTalentsTables < ActiveRecord::Migration[6.1]
  def change
    add_column :talents, :entity, :string
  end
end
