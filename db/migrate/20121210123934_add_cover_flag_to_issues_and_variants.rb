class AddCoverFlagToIssuesAndVariants < ActiveRecord::Migration
  def change
    add_column :issues, :has_cover?, :boolean
    add_column :variants, :has_cover?, :boolean
  end
end
