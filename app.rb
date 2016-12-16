require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/new_recipe') do
  Recipe.create({:name => params.fetch('name')})
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

post('/new_tags/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  if params.keys.include?('tag')
    tags = params.fetch('tag')
    @recipe.update({:tag_ids => tags})
  end
    redirect to ("/recipe/#{@recipe.id}")
end

post('/add_tag/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.tags.push(Tag.create({:text => params.fetch('new_tag')}))
  redirect to ("/recipe/#{@recipe.id}")
end
