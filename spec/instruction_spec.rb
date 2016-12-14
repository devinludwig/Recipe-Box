require("spec_helper")

describe(Instruction) do
  it {should have_many(:recipes)}
end
