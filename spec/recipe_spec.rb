require("spec_helper")

describe(Recipe) do
  it {should have_many(:ingredients)}
  it {should have_many(:measurements)}
  it {should have_many(:instructions_recipes)}
  it {should have_many(:instructions)}
  it {should have_and_belong_to_many(:tags)}
end
