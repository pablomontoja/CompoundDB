class AddAdditionalInfoToCompounds < ActiveRecord::Migration
  def change
    add_column :compounds, :additional_info, :string
  end
end
