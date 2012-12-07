class CreatePreviews < ActiveRecord::Migration
  def change
    create_table :previews do |t|
      t.string :first_diamd_no
      t.string :last_diamd_no
      t.boolean :digested, :default => false
      t.timestamps
    end
  end
end
