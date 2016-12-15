require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/new_recipe') do
Recipe.new({:name => params.fetch('name')})
  redirect to('/')
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  erb(:recipe_page)
end

post('/new_ingredient/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  ingredient = Ingredient.create({:text => params.fetch("new_ingredient")})
  @recipe.ingredients.push(ingredient)
  Measurement.find_by({:recipe_id => @recipe.id, :ingredient_id => ingredient.id}).update({:amount => params.fetch('new_amount')})
  redirect to ("/recipe/#{@recipe.id}")
end

post('/new_instruction/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.instructions.push(Instruction.create({:text => params.fetch("new_instruction")}))
  redirect to ("/recipe/#{@recipe.id}")
end
