class CreateCover < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.belongs_to :issue
      t.string :image
      t.string :homing_string
      t.string :cover_artist
      t.string :diamond_number
    end

  end
end
