class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table "order_details", force: :cascade do |t|
      t.integer "price"
      t.integer "quantity"
      t.bigint "order_id", null: false
      t.bigint "item_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "total_price"
      t.string "title"
      t.index ["item_id"], name: "index_order_details_on_item_id"
      t.index ["order_id"], name: "index_order_details_on_order_id"
    end
  end
end
