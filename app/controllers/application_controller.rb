# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  def initialize_session
    # セッションに :cart というキーがなければ、新しくハッシュを作成する
    session[:cart] ||= {}
  end

  def cart
    session[:cart]
  end
end