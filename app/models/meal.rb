class Meal < ApplicationRecord

    belongs_to :person

    validates :name, length: { minimum: 6}

end
