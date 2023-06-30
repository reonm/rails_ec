# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :basic_auth, except: %i[index show]

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
