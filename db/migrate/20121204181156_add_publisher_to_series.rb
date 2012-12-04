class AddPublisherToSeries < ActiveRecord::Migration
  def change
    change_table :series do |t|
      t.references :publisher
    end
  end
end
