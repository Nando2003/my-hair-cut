# frozen_string_literal: true

class InertiaController < ApplicationController
  # Share data with all Inertia responses
  # see https://inertia-rails.dev/guide/shared-data
  inertia_share user: -> { Current.user&.as_json(only: [:id, :first_name, :last_name, :email_address]) }
  inertia_share flash: -> { flash.to_hash.slice("alert", "notice") }
end
