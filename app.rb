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
