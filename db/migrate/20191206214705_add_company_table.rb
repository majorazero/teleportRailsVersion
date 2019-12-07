# frozen_string_literal: true

class AddCompanyTable < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :companies, :name, :unique => true
    add_index :products,  :link, :unique => true

    add_reference :products, :company, :index => true,
      :foreign_key => true
  end
end
