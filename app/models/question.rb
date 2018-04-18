class Question < ApplicationRecord
  has_many :answers
  
  validates :title, length:{ minimum: 20}
  validates :description, length:{ minimum: 50}
end
