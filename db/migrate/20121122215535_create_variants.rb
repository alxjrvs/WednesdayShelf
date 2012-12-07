class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :issue
      t.string    :diamond_no
      t.string      :title
      t.text        :description
      t.string      :diamond_no
      t.string      :stock_no
      t.string      :writer
      t.string      :artist
      t.string      :cover_artist
      t.integer     :issue_no
      t.integer     :max_issue
      t.float       :price
      t.timestamps
    end
  end
end
