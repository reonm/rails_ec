# frozen_string_literal: true

class AfterCheckoutMailer < ApplicationMailer
  default from: " postmaster@sandbox251ed0d7ba6d4eaa8d36ba9be9337e11.mailgun.org " # 送信元のメールアドレスを設定

  def receipt(order)
    @order = order
    @order_details = OrderDetail.where(order_id: order.id) 
    mail(to: @order.email, subject: 'Your Purchase Receipt')
  end
end
