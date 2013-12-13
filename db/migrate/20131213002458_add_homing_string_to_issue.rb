class AddHomingStringToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :homing_string, :string
  end
end
