# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        # セッションのカート情報をOrderDetailとして保存
        session[:cart].each do |item_id, quantity|
          item = Item.find(item_id)
          price = item.price
          total_price = price * quantity
          title = item.title
          @order.order_details.create(item_id: item_id, quantity: quantity, price: price, total_price: total_price,
            title: title
                                      # grand_total_amount: grand_total_amount
          )
          # このコードは、Orderモデルが関連付けられたOrderDetailモデルを持っていると仮定しています。
          # また、OrderDetailにはitem_idとquantityのカラムがあると仮定しています。
        end

        AfterCheckoutMailer.receipt(@order).deliver_now

        # カートの内容を削除
        session[:cart] = {}

        # 例としてトップページにリダイレクトする場合
        format.html { redirect_to root_path, notice: 'ご購入ありがとうございました' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country, :state,
                                  :zip, :name_on_card, :credit_card_number, :expiration, :cvv)
  end
end
