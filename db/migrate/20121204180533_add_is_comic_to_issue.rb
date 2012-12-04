class AddIsComicToIssue < ActiveRecord::Migration
  def change
    change_table :issues do |t|
      t.boolean :is_comic
    end
  end
end
