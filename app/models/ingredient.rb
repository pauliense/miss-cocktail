class Ingredient < ApplicationRecord
  has_many :doses


  validates :name, uniqueness: true, presence: {message: "cannot be blank!"}
end


