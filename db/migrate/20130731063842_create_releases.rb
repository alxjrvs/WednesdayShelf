class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.date :release_date
    end
  end
end
