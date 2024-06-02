# frozen_string_literal: true

class Status < ApplicationRecord
  validates :name, uniqueness: true, inclusion: { in: %w[new in_progress done] }
  # BEGIN
  has_many :task
  # END
end
