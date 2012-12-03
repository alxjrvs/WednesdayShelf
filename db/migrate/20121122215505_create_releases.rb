class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.date :ship_date
      t.timestamps
    end
  end
end
