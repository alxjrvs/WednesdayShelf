class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.belongs_to :issue
      t.string :cover
      t.integer :release_year
      t.string :diamond_number
      t.string :raw_title
      t.string :series_title
      t.integer  :issue_number
      t.float :price
      t.string :stock_number
      t.string :variant_description
      t.string :author
      t.string :artist
      t.string :cover_artist
      t.date :release_date

      t.timestamps
    end

    add_index :variants, :issue_id
  end
end
