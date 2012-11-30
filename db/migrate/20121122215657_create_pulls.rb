class CreatePulls < ActiveRecord::Migration
  def change
    create_table :pulls do |t|
      t.references :title
      t.references :list
      t.timestamps
    end
  end
end
