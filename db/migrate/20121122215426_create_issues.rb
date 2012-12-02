class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references  :release
      t.references  :series
      t.string      :title
      t.text        :description
      t.string      :diamond_no
      t.string      :stock_no
      t.string      :image_link
      t.string      :ship_date
      t.float       :price
      t.string      :writer_name
      t.string      :artist_name
      t.string      :cover_artist_name
      t.string      :series_name
      t.integer     :issue_no
      t.integer     :max_issue
      t.string      :publisher_name
      t.integer      :page_count
      t.timestamps
    end
  end
end