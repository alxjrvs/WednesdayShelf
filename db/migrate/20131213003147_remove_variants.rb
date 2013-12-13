class RemoveVariants < ActiveRecord::Migration
  def change
    drop_table :variants
  end
end
