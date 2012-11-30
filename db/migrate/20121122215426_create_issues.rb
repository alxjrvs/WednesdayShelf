class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :release
      t.references :title
      t.timestamps
    end
  end
end
