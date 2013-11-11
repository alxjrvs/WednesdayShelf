class CreatePullList < ActiveRecord::Migration
  def change
    create_table :pull_lists do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end

    add_index :pull_lists, :user_id
  end
end
