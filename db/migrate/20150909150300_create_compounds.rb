class CreateCompounds < ActiveRecord::Migration
  def change
    create_table :compounds do |t|
      t.string :name
      t.string :molecular_formula
      t.float :molar_mass
      t.string :cas
      t.text :structure
      t.string :amount
      t.string :shelf
      t.string :room_number

      t.timestamps null: false
    end
  end
end
