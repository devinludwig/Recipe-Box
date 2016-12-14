class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table(:recipes) do |table|
      table.column(:name, :string)
      table.column(:rating, :integer)
    end
  end
end
