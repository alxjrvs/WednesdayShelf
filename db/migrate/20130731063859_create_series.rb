class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.belongs_to :publisher
      t.string :name

      t.timestamps
    end

    add_index :series, :publisher_id
  end
end
