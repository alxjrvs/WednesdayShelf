class AddLocalLinkToIssue < ActiveRecord::Migration
  def change
    change_table :issues do |t|
      t.string :local_link
    end
  end
end
