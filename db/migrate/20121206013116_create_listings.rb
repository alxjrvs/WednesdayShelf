class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :diamd_no
      t.string :stock_no
      t.string :parent_item_no_alt
      t.string :bounce_use_item
      t.string :full_title
      t.string :full_desc
      t.string :main_desc
      t.string :variant_desc
      t.string :series_code
      t.string :issue_no
      t.string :issue_seq_no
      t.string :volume_tag
      t.string :max_issue
      t.string :publisher
      t.string :upc_no
      t.string :isbn_no
      t.string :ean_no
      t.string :cards_per_pack
      t.string :pack_per_box
      t.string :box_per_case
      t.string :discount_code
      t.string :increment_no
      t.string :prnt_date
      t.string :foc_vendor
      t.string :ship_date
      t.string :srp
      t.string :short_isbn_no
      t.string :category
      t.string :genre
      t.string :brand_code
      t.string :mature
      t.string :adult
      t.string :oa
      t.string :caut1
      t.string :caut2
      t.string :caut3
      t.string :resol
      t.string :price
      t.string :note_price
      t.text :order_form_notes
      t.string :page
      t.string :writer
      t.string :artist
      t.string :cover_artist
      t.references :preview

      t.timestamps
    end
  end
end
