class CreatePulls < ActiveRecord::Migration
  def change
    create_table :pulls do |t|
      t.belongs_to :series
      t.belongs_to :pull_list
      t.timestamps
    end
    add_index :pulls, :series_id
    add_index :pulls, :pull_list_id
  end
end
