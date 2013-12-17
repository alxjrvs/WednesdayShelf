class AddDiamondItemFieldsToDiamondItem < ActiveRecord::Migration
  def change
    add_column :diamond_items, :state, :string
    add_column :diamond_items, :raw_title, :string
    add_column :diamond_items, :stock_number, :string
    add_column :diamond_items, :publisher, :string
    add_column :diamond_items, :creators, :string
    add_column :diamond_items, :description, :text
    add_column :diamond_items, :release_date, :date
    add_column :diamond_items, :price, :float
    add_column :diamond_items, :category_code, :integer
  end
end
