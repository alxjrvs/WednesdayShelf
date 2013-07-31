class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :status
      t.string :stock_number
      t.string :item_code
      t.string :genre_code
      t.string :brand_code
      t.belongs_to :series

      t.timestamps
    end

    add_index :issues, :series_id
  end
end
