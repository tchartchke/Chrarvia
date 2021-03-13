class Quiz < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  has_many :rounds
  has_many :questions, through: :rounds

  validates :title, presence: true
end
