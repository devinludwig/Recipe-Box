class Ingredient < ActiveRecord::Base
  has_many :measurements
  has_many :recipes, through: :measurements
  validates(:text, {:presence => true})
  validates(:text, {:uniqueness => true})
end
