class Ingredient < ActiveRecord::Base
  has_many :measurements
  has_many :recipes, through: :measurements
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})
end
