class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :series
      t.belongs_to :release

      t.string :cover
      t.string :raw_title
      t.string :stock_number
      t.string :diamond_number
      t.text   :description
      t.date   :release_date
      t.float  :price
      t.string :title
      t.string :series_title
      t.string :special_issue_number
      t.integer  :issue_number
      t.integer  :max_issue
      t.string :author
      t.string :cover_artist
      t.string :artist
      t.integer :release_year

      t.timestamps
    end

    add_index :issues, :series_id
    add_index :issues, :release_id
  end
end
