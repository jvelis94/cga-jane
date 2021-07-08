class CreateTalents < ActiveRecord::Migration[6.1]
  def change
    create_table :talents do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :business
      t.string :unit
      t.string :team
      t.string :sub_team
      t.string :title
      t.string :contact
      t.text :notes
      t.string :email
      t.boolean :intern
      t.string :grad_year
      t.string :entry
      t.string :year
      t.string :institution
      t.string :level
      t.string :course

      t.timestamps
    end
  end
end
