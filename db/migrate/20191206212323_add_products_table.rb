# frozen_string_literal: true

class AddProductsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string  :name, :null => false
      t.integer :category, :null => false
      t.integer :product_type, :null => false
      t.string  :link, :null => false, :unique => true
      t.decimal :price, :null => false
      t.integer :demographic, :null => false
      t.decimal :shipping, :null => false
      t.decimal :shipping_threshold
      t.timestamps
    end
  end
end
