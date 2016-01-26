class AddColumnToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :cas_number, :string
  end
end
