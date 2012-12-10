class AddCoverFlagToIssuesAndVariants < ActiveRecord::Migration
  def change
    add_column :issues, :has_cover, :boolean, :default => false
    add_column :variants, :has_cover, :boolean, :default => false4
  end
end
