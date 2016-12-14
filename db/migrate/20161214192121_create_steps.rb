class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    add_column(:instructions_recipes, :step, :integer)
  end
end
