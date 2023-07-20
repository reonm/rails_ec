# frozen_string_literal: true

class ChangePriceToIntegerInItems < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :items, :price, 'integer USING CAST(price AS integer)'
    end

    def down
      change_column :items, :price, :decimal
    end
  end
end
