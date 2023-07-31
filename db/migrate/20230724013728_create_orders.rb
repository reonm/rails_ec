# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :address
      t.string :address2
      t.string :country
      t.string :state
      t.integer :zip
      t.string :name_on_card
      t.integer :credit_card_number
      t.date :expiration
      t.integer :cvv

      t.timestamps
    end
  end
end
