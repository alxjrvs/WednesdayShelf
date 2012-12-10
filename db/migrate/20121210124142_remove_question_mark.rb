class RemoveQuestionMark < ActiveRecord::Migration
  def change
    remove_column :issues, :has_cover?, :boolean
    remove_column :variants, :has_cover?, :boolean
    add_column :issues, :has_cover, :boolean, :default =>false
    add_column :variants, :has_cover, :boolean, :default => false
  end
end
