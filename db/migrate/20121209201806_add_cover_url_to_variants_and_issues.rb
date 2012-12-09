class AddCoverUrlToVariantsAndIssues < ActiveRecord::Migration
  def change
    add_column :variants, :cover_url, :string
    add_column :issues, :cover_url, :string
  end
end
