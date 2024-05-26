# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  complited   :boolean          default(TRUE), not null
#  creator     :string           not null
#  description :text
#  name        :string           not null
#  performer   :string
#  status      :string           default("new"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :creator, presence: true
  validates :complited, presence: true
end
