class ChangeReleaseDateToDateOnRelease < ActiveRecord::Migration
  def change
    add_column :releases, :date, :date
    remove_column :releases, :release_date
  end
end
