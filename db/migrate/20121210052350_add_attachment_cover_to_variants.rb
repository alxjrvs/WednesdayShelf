class AddAttachmentCoverToVariants < ActiveRecord::Migration
  def self.up
    change_table :variants do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :variants, :cover
  end
end
