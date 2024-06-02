# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :status
  belongs_to :user

  scope :by_creation_date_desc, -> { order(created_at: :desc) }
end
