# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  before_action :basic_auth
  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
