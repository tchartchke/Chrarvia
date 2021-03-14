class Question < ApplicationRecord
  belongs_to :round
  # has_one :answer

  validates :question, presence: true
  validates :answer, presence: true
end
