class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string    :ship_date
      t.timestamps
    end
  end
end
