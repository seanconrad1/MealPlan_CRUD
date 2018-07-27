class Person < ApplicationRecord
  has_many :meals, dependent: :destroy
end
