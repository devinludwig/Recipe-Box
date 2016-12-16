class Instruction < ActiveRecord::Base
  has_many :instructions_recipes
  has_many :recipes, through: :instructions_recipes
  validates(:text, {:presence => true})
  validates(:text, {:uniqueness => true})
end
