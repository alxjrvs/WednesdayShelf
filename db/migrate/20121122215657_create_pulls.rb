class CreatePulls < ActiveRecord::Migration
  def change
    create_table :pulls do |t|

      t.timestamps
    end
  end
end
