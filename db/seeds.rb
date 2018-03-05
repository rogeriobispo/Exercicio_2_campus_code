# User Default
User.create(email: 'admin@admin.com.br', password: '123456')
# cuisines
cuisine = Cuisine.create(name: 'Brasileira')
Cuisine.create(name: 'Americana')
Cuisine.create(name: 'Italiana')
# Recipe Types
recipe_type = RecipeType.create(name: 'Café da Manha')
RecipeType.create(name: 'Sobremesa')
RecipeType.create(name: 'Entrada')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
