class AddCreatedByToCompounds < ActiveRecord::Migration
  def change
    add_column :compounds, :created_by, :integer
    add_column :compounds, :edited_by, :integer
  end
end
