class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :formula
      t.float :min_mass
      t.float :max_mass
      t.text :molecule

      t.timestamps null: false
    end
  end
end
