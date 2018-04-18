class Answer < ApplicationRecord
  validates :description, length: {minimum: 50}
  validates :question_id, presence: true
end
