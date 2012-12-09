class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :diamd_no
      t.text :stock_no
      t.text :parent_item_no_alt
      t.text :bounce_use_item
      t.text :full_title
      t.text :full_desc
      t.text :main_desc
      t.text :variant_desc
      t.text :series_code
      t.text :issue_no
      t.text :issue_seq_no
      t.text :volume_tag
      t.text :max_issue
      t.text :publisher
      t.text :upc_no
      t.text :isbn_no
      t.text :ean_no
      t.text :cards_per_pack
      t.text :pack_per_box
      t.text :box_per_case
      t.text :discount_code
      t.text :increment_no
      t.text :prnt_date
      t.text :foc_vendor
      t.text :ship_date
      t.text :srp
      t.text :short_isbn_no
      t.text :category
      t.text :genre
      t.text :brand_code
      t.text :mature
      t.text :adult
      t.text :oa
      t.text :caut1
      t.text :caut2
      t.text :caut3
      t.text :resol
      t.text :price
      t.text :note_price
      t.text :order_form_notes
      t.text :page
      t.text :writer
      t.text :artist
      t.text :cover_artist
      t.references :preview

      t.timestamps
    end
  end
end
