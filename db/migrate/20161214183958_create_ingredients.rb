class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table(:ingredients) do |table|
      table.column(:text, :string)
    end

    create_table(:measurements) do |table|
      table.column(:recipe_id, :integer)
      table.column(:ingredient_id, :integer)
      table.column(:amount, :string)
    end

    create_table(:instructions_recipes) do |table|
      table.column(:recipe_id, :integer)
      table.column(:instruction_id, :integer)
    end

    create_table(:instructions) do |table|
      table.column(:text, :string)
    end

    create_table(:recipes_tags) do |table|
      table.column(:recipe_id, :integer)
      table.column(:tag_id, :integer)
    end

    create_table(:tags) do |table|
      table.column(:text, :string)
    end
  end
end
