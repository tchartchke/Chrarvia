class User < ApplicationRecord
  has_many :quizzes, :foreign_key => 'host_id'
end
