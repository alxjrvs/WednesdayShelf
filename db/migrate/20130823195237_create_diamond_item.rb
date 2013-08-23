class CreateDiamondItem < ActiveRecord::Migration
  def change
    create_table :diamond_items do |t|
      t.string 'diamond_number'
    end
  end
end
