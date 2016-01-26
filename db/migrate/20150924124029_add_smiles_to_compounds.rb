class AddSmilesToCompounds < ActiveRecord::Migration
  def change
    add_column :compounds, :smiles, :string
  end
end
