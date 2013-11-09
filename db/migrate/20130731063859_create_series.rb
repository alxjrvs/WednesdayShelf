class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.belongs_to :publisher
      t.string :title

      t.timestamps
    end

    add_index :series, :publisher_id
  end
end
