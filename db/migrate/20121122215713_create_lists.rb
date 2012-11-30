class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user
      t.references :store
      t.timestamps
    end
  end
end
