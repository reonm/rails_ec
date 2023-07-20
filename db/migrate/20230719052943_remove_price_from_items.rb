# frozen_string_literal: true

class RemovePriceFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :price, :decimal
  end
end
