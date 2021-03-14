class Round < ApplicationRecord
  belongs_to :quiz
  has_many :questions
  # has_many :answers, through: :questions
  # accepts_nested_attributes_for :questions
  # accepts_nested_attributes_for :answers

  validates :subject, presence: true

  def questions_attributes=(question_attributes)
    question_attributes.values.each do |question_attribute|
      question = Question.find_or_create_by(question_attribute)
      questions << question
    end
  end

end
