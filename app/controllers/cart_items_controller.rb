# frozen_string_literal: true

# This class is responsible for handling cart items. It allows for adding,
# removing and updating items within a user's shopping cart.
# CartItemsController handles actions related to cart items.
class CartItemsController < ApplicationController
  def show
    @cart = session[:cart] || {}
  end

  def reset
    session.delete(:cart)
    redirect_to root_path, notice: 'Cart has been emptied.'
  end

  def clear_cart
    session[:cart] = {} # カートの内容を空のハッシュにリセット

    redirect_to cart_item_path # カートの表示ページにリダイレクトする
  end

  def delete_item
    id = params[:id].to_s
    session[:cart].delete(id) # カートからアイテムを削除

    redirect_to cart_item_path # カートの表示ページにリダイレクトする
  end
end
