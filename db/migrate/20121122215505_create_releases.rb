class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|

      t.timestamps
    end
  end
end
