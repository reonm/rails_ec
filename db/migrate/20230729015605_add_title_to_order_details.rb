class AddTitleToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :title, :string
  end
end
