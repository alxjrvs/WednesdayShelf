class AddCoversToVariants < ActiveRecord::Migration
  def change
    add_attachment :variants, :cover
    add_attachment :issues, :cover
  end
end
