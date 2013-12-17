class AddDefaultValueToDiamondItemValidity < ActiveRecord::Migration
  def change
    change_column :diamond_items, :valid_diamond_number, :boolean, default: true
  end
end
