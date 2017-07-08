require 'rails_helper'

feature 'Visitor view only recent recipes on home page' do

  scenario 'successfully' do
    #cria os dados necessários
    old_recipe = create_recipe('Old Recipe','old_cuisine','old_tipo')
    [
      ['Cozinha_1','Tipo_1'],
      ['Cozinha_2','Tipo_2'],
      ['Cozinha_3','Tipo_3'],
      ['Cozinha_4','Tipo_4'],
      ['Cozinha_5','Tipo_5']
    ].each{|model| create_recipe('Another Recipes',model[0] , model[1]) }

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recent_recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          ingredients: 'Cenoura, acucar, oleo e chocolate',
                          method: 'Misturar tudo, bater e assar',
                          cook_time: 60)

    # simula a ação do usuário
    visit root_path

    expect(page).to have_css('h1', text: recent_recipe.title)
    expect(page).to have_css('li', text: recent_recipe.recipe_type.name)
    expect(page).to have_css('li', text: recent_recipe.cuisine.name)
    expect(page).to have_css('li', text: recent_recipe.difficulty)
    expect(page).to have_css('li', text: "#{recent_recipe.cook_time} minutos")

    expect(page).not_to have_css('h1', text: old_recipe.title)
  end

  scenario 'and then view all the recipes' do
    #cria os dados necessários
    old_recipe = create_recipe('Old Recipe','old_cuisine','old_tipo')
    [
      ['Cozinha_1','Tipo_1'],
      ['Cozinha_2','Tipo_2'],
      ['Cozinha_3','Tipo_3'],
      ['Cozinha_4','Tipo_4'],
      ['Cozinha_5','Tipo_5'],
      ['Cozinha_6','Tipo_6'],
    ].each{|model| create_recipe('Another Recipes',model[0] , model[1]) }

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recent_recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          ingredients: 'Cenoura, acucar, oleo e chocolate',
                          method: 'Misturar tudo, bater e assar',
                          cook_time: 60)

    # simula a ação do usuário
    visit root_path
    click_on 'Todas receitas'

    expect(page).to have_css('h1', text: recent_recipe.title)
    expect(page).to have_css('li', text: recent_recipe.recipe_type.name)
    expect(page).to have_css('li', text: recent_recipe.cuisine.name)
    expect(page).to have_css('li', text: recent_recipe.difficulty)
    expect(page).to have_css('li', text: "#{recent_recipe.cook_time} minutos")

    expect(page).to have_css('h1', text: old_recipe.title)
    expect(page).to have_css('li', text: old_recipe.recipe_type.name)
    expect(page).to have_css('li', text: old_recipe.cuisine.name)
    expect(page).to have_css('li', text: old_recipe.difficulty)
    expect(page).to have_css('li', text: "#{old_recipe.cook_time} minutos")


  end


  def create_recipe(recipe_name,cuisine_name,recipe_type_name)
    generic_cuisine = Cuisine.create(name: cuisine_name)
    generic_type = RecipeType.create(name: recipe_type_name)
    Recipe.create(title: recipe_name, recipe_type: generic_type,
                  cuisine: generic_cuisine, difficulty: 'Facil',
                  ingredients: 'Ingredientes em lista',
                  method: 'Passo a passo do preparo',
                  cook_time: 60)
  end

end
