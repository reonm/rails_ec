# frozen_string_literal: true

# This class is responsible for handling cart items. It allows for adding,
# removing and updating items within a user's shopping cart.
# CartItemsController handles actions related to cart items.
class CartItemsController < ApplicationController
  def show
    @cart = session[:cart] || {}
    @order = Order.new
  end

  def reset
    session.delete(:cart)
    redirect_to root_path, notice: 'Cart has been emptied.'
  end

  # def clear_cart
  #   session[:cart] = {} # カートの内容を空のハッシュにリセット

  #   redirect_to cart_item_path # カートの表示ページにリダイレクトする
  # end

  def delete_item
    id = params[:id].to_s
    session[:cart].delete(id) # カートからアイテムを削除

    redirect_to cart_item_path # カートの表示ページにリダイレクトする
  end

  def create
    @cart = session[:cart] || {}
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to items_path, notice: 'ご購入ありがとうございました' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country, :state, :zip, :name_on_card, :credit_card_number, :expiration, :cvv)
  end
end
