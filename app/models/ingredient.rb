class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, uniqueness: true, presence: {message: "cannot be blank!"}

  def self.not_own(cocktail)
    self.all - cocktail.ingredients
  end

end


