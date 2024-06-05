# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 500 }
end
