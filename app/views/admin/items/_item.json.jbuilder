# frozen_string_literal: true

json.extract! item, :id, :title, :description, :status, :created_at, :updated_at
json.url task_url(item, format: :json)
