class Recipe < ActiveRecord::Base
  has_many :measurements
  has_many :instructions_recipes
  has_many :ingredients, through: :measurements
  has_many :instructions, through: :instructions_recipes
  has_and_belongs_to_many :tags
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})
end
