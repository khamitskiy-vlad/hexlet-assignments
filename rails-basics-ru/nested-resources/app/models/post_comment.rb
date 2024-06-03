# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, length: { minimum: 5, maximum: 500 }
end
