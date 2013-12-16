class AddValidToDiamondItem < ActiveRecord::Migration
  def change
    add_column :diamond_items, :valid_diamond_number, :boolean
  end
end
