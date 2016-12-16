class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:text, {:presence => true})
  validates(:text, {:uniqueness => true})
end
